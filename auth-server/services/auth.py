import datetime

import bson
import grpc
from google.protobuf import timestamp_pb2
from google.protobuf.json_format import MessageToJson

import auth_pb2 as pb
import auth_pb2_grpc as pb_grpc
import db
import tokenizer


# auth service implementation
# https://pypi.org/project/paseto/
class AuthServer(pb_grpc.AuthServiceServicer):
    async def login(self, request, context):
        return None

    def logout(self, request, context):
        return None

    async def create_account(self, request, context):
        auth_col = await db.get_auth_collection()
        doc = auth_col.find_one({"username": request.username})
        if doc:
            context.set_code(grpc.StatusCode.ALREADY_EXISTS)
            context.set_details('Account already exists for this user')
            return None

        # todo -> create a new customer
        # todo -> create a new session for the customer
        # todo -> return session details
        account = MessageToJson(request)
        result = auth_col.insert_one(account)
        account["id"] = result.inserted_id
        auth_col.replace_one({"_id": bson.ObjectId(result.inserted_id)}, account)
        access_token = tokenizer.generate_token(request.username, request.password)
        refresh_token = tokenizer.generate_token(request.username, request.password)
        timestamp = timestamp_pb2.Timestamp()
        timestamp.FromDatetime(datetime.datetime.utcnow())
        access_token_expiry = timestamp
        refresh_token_expiry = timestamp
        created_at = timestamp
        return pb.Account(access_token=access_token, refresh_token=refresh_token, session_id=str(result.inserted_id),
                          access_token_expiry=access_token_expiry, refresh_token_expiry=refresh_token_expiry,
                          created_at=created_at)

    def update_password(self, request, context):
        return None

    def verify_otp(self, request, context):
        return None

    def send_otp(self, request, context):
        return None

    def reset_password(self, request, context):
        return None

    def verify_token(self, request, context):
        return None

# auth_col = await db.get_auth_collection()
# doc = auth_col.find_one({"username": target.username})
# if doc is None:
#     raise grpc.RpcError(grpc.StatusCode.NOT_FOUND, "Account not found")
# token = tokenizer.generate_token("quabynahdennis@gmail.com", "quabynah")
# act = pb.Account(access_token=token, refresh_token=token, session_id="sample")
# return act
