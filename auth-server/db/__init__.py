from pymongo import MongoClient

client = MongoClient(host=['localhost:27017'], connect=True)
qiggy_database = client["qiggy_dev"]


# session database provider
async def get_session_collection():
    return qiggy_database.sessions


# accounts database provider
async def get_auth_collection():
    return qiggy_database.accounts
