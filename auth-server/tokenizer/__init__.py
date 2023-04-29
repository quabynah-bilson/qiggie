import datetime

import bcrypt
import jwt

_key = b"qiggy@2023-qcodelabsllc"


# create a JWT that expires in 5 minutes (300 seconds)
def generate_token(username: str, uid: str, hours_old: int) -> str or None:
    try:
        now = datetime.datetime.utcnow()
        return jwt.encode({"aud": username,
                           "sub": uid,
                           "iat": now,
                           "exp": now + datetime.timedelta(hours=hours_old)},
                          str(_key), algorithm="HS256")
    except jwt.PyJWTError:
        return None


# parse token
def parse_token(token_to_parse: str) -> str or None:
    try:
        jwt.decode(token_to_parse, str(_key), algorithms=["HS256"])
        parsed = token_to_parse
        print(parsed)
        return str(parsed)
    except jwt.InvalidTokenError or jwt.ExpiredSignatureError:
        return None


# hash password
def hash_password(password: str) -> str:
    return bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt())


# verify password hash
def verify_password_hash(raw_password: str, hashed_password: str) -> bool:
    return bcrypt.checkpw(raw_password.encode('utf-8'), hashed_password.encode('utf-8'))
