message = b"foo"  # your data
_key = b"0" * 32  # encryption key


# create a paseto token that expires in 5 minutes (300 seconds)
def generate_token(username: str, uid: str) -> str:
    # payload = username + ":" + uid
    # token = encrypt(message, _key)
    token = username + ":" + uid
    print(token)
    return str(token)


# parse token
def parse_token(token_to_parse: str) -> str:
    # parsed = decrypt(token_to_parse.encode("utf-8"), _key)
    parsed = token_to_parse
    print(parsed)
    return str(parsed)
