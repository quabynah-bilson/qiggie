import datetime
import json

import bson
import grpc
from google.protobuf import empty_pb2
from google.protobuf import timestamp_pb2
from google.protobuf.json_format import MessageToJson

import auth_pb2 as pb
import auth_pb2_grpc as pb_grpc
import db
import tokenizer


# auth service implementation
# https://pypi.org/project/paseto/
async def create_new_session_from_credentials(username: str, uid: str) -> pb.Session or None:
    # timestamp init
    timestamp = timestamp_pb2.Timestamp()
    now = datetime.datetime.utcnow()

    # access token expiry (1 hour)
    access_token_expiry = timestamp.FromDatetime(now + datetime.timedelta(hours=1))

    # refresh token expiry (72 hours)
    refresh_token_expiry = timestamp.FromDatetime(now + datetime.timedelta(hours=72))

    # access token config
    access_token = tokenizer.generate_token(username, uid, 1)
    if access_token is None:
        return None

    # refresh token config
    refresh_token = tokenizer.generate_token(username, uid, 72)
    if refresh_token is None:
        return None

    session = pb.Session(
        access_token=access_token,
        refresh_token=refresh_token,
        access_token_expiry=access_token_expiry,
        refresh_token_expiry=refresh_token_expiry,
        session_id=uid,
    )

    # save session
    session_col = await db.get_session_collection()
    session_to_save = json.loads(
        MessageToJson(session, including_default_value_fields=True, preserving_proto_field_name=True))
    session_to_save["_id"] = bson.ObjectId(session.session_id)
    session_col.find_one_and_delete({"session_id": str(session_to_save['_id'])})
    session_col.insert_one(session_to_save)

    return session


class AuthServer(pb_grpc.AuthServiceServicer):
    async def refresh_token(self, request, context):
        # todo refresh access token
        return None

    async def login(self, request, context):

        try:

            # get associated account
            auth_col = await db.get_auth_collection()
            account_doc = auth_col.find_one({"username": request.username})
            if account_doc is None:
                context.set_code(grpc.StatusCode.NOT_FOUND)
                context.set_details('Login failed')
                return None

            # verify password
            if not tokenizer.verify_password_hash(request.password, account_doc['password']):
                context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
                context.set_details('Your credentials are invalid. Please try again')
                return None

            # create a new session
            session = await create_new_session_from_credentials(account_doc['username'], str(account_doc['_id']))
            if session is None:
                context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
                context.set_details('Account details invalid')
                return None

            account_pb = pb.Account(
                username=account_doc['username'],
                display_name=account_doc['display_name'],
                phone_number=account_doc['phone_number'],
                # password=account_doc['password'],
            )

            return pb.AuthResponse(account=account_pb, session=session)
        except grpc.RpcError:
            context.set_code(grpc.StatusCode.NOT_FOUND)
            context.set_details('Login failed')
            return None

    async def logout(self, request, context):
        session_col = await db.get_session_collection()
        session_col.find_one_and_delete({"session_id": request.value})
        return empty_pb2.Empty()

    async def create_account(self, request, context):
        auth_col = await db.get_auth_collection()
        # get account from username
        account_doc = auth_col.find_one({"username": request.username})
        if account_doc is not None:
            context.set_code(grpc.StatusCode.ALREADY_EXISTS)
            context.set_details('Account already exists for this user')
            return None
        # serialize data
        account = pb.Account(username=request.username,
                             password=request.password,
                             phone_number=request.phone_number,
                             display_name=request.display_name)
        account.password = tokenizer.hash_password(request.password)
        account_to_save = json.loads(
            MessageToJson(account, including_default_value_fields=True, preserving_proto_field_name=True))

        # create new account
        result = auth_col.insert_one(account_to_save)
        account_to_save["id"] = str(result.inserted_id)

        # update data with id
        auth_col.replace_one({"_id": bson.ObjectId(result.inserted_id)}, account_to_save)

        session = await create_new_session_from_credentials(account.username, str(result.inserted_id))
        if session is None:
            context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
            context.set_details('Account details are invalid')
            return None

        return pb.AuthResponse(account=account, session=session)

    def update_password(self, request, context):
        return None

    def verify_auth_code(self, request, context):
        if request.code == 0 or request.code != 123456:
            context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
            context.set_details('Invalid verification code')
            return None

        response = pb.AuthCodeResponse(
            message='Phone number verified successfully',
            status=pb.PhoneVerificationStatus.verified,
            successful=True,
        )
        return response

    def send_auth_code(self, request, context):
        print(f"request for OTP verification -> {request.value}")

        # clean input (remove all unnecessary characters)
        phone_number = request.value.replace(' ', '')
        phone_number = phone_number[1:len(phone_number)]
        phone_number = '+233' + phone_number
        print(f'formatted phone number -> {phone_number}')

        # todo -> send OTP to device
        response = pb.AuthCodeResponse(
            message=f'A verification code has been sent to {phone_number}',
            status=pb.PhoneVerificationStatus.code_sent,
            successful=True,
        )
        return response

    def reset_password(self, request, context):
        # todo -> implement this
        return None

    def verify_token(self, request, context):
        # todo -> implement this
        return None

    async def update_account(self, request, context):
        auth_col = await db.get_auth_collection()
        account_filter = {"username": request.username}
        account_doc = auth_col.find_one(account_filter)
        if account_doc is None:
            context.set_code(grpc.StatusCode.NOT_FOUND)
            context.set_details('There seems to be a problem with this account. Please sign in again to continue')
            return None

        # format payload
        formatted_doc = json.loads(MessageToJson(request, preserving_proto_field_name=True))
        updated_doc = auth_col.update_one(account_filter, {"$set": formatted_doc})
        print(f'updating account -> {updated_doc}')

        return request

    async def verify_phone_number(self, request_iterator, context):
        try:
            # Set a 5-second deadline for the RPC request
            # timeout_seconds = 5
            # deadline = await grpc.aio.timeout(timeout_seconds).deadline()
            print(f'object received -> {request_iterator}')
            if request_iterator is grpc.aio.EOF:
                context.set_code(grpc.StatusCode.DEADLINE_EXCEEDED)
                context.set_details('You have exceeded the maximum allowed time for verification. Please start afresh')
                yield None
            print(f'type of request {type(request_iterator)}')
            # for request in request_iterator:
            #     print(f"request for OTP verification -> {request.phone_number}")

                # clean input (remove all unnecessary characters)
                # phone_number = request.phone_number.replace(' ', '')
                # phone_number = phone_number[1:len(phone_number)]
                # phone_number = '+233' + phone_number
                # print(f'formatted phone number -> {phone_number}')

                # todo -> implement OTP service

                # send response
                # yield pb.AuthCodeResponse(
                #     successful=True,
                #     status=pb.PhoneVerificationStatus.code_sent,
                #     message='A verification code has been sent to '
                # )

            yield pb.AuthCodeResponse(
                successful=True,
                status=pb.PhoneVerificationStatus.code_sent,
                message=f'A verification code has been sent to {request_iterator}'
            )

        except grpc.RpcError or TypeError:
            context.set_code(grpc.StatusCode.DEADLINE_EXCEEDED)
            context.set_details('You have exceeded the maximum allowed time for verification. Please start afresh')
            yield None
