import asyncio
import logging
from concurrent import futures

import grpc
from grpc_reflection.v1alpha import reflection

import auth_pb2 as pb
import auth_pb2_grpc as pb_grpc
import db
from services import auth


async def serve() -> None:
    print("creating grpc auth server...on 1140")
    server = grpc.aio.server(futures.ThreadPoolExecutor(max_workers=10))

    # register services
    pb_grpc.add_AuthServiceServicer_to_server(auth.AuthServer(), server)

    # add reflection
    SERVICE_NAMES = (
        pb.DESCRIPTOR.services_by_name['AuthService'].full_name,
        reflection.SERVICE_NAME,
    )
    reflection.enable_server_reflection(SERVICE_NAMES, server)

    # port
    server.add_insecure_port("0.0.0.0:1140")

    # start server
    await server.start()
    await server.wait_for_termination()


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    asyncio.run(serve())
