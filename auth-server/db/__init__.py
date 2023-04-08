from pymongo import MongoClient

client = MongoClient(host=['localhost:27017'], connect=True)
qiggy_database = client["qiggy"]


# establish connection to mongodb
async def get_auth_collection():
    print("database connection established")
    return qiggy_database.accounts
