# shellcheck disable=SC2046
BANK_PROTO_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/go-bank-server/protos
CUSTOMER_PROTO_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/rust-customer-server/protos
SAVINGS_PROTO_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/savings-server/protos

# generate for mobile
cd /Users/quabynah/src/projects/personal-studies/piggybank/mobile || exit
protoc -I=$BANK_PROTO_PATH \
  --dart_out=grpc:lib/protos \
  $(find $BANK_PROTO_PATH -iname "*.proto")

protoc -I=$CUSTOMER_PROTO_PATH \
  --dart_out=grpc:lib/protos \
  $(find $CUSTOMER_PROTO_PATH -iname "*.proto")

protoc -I=$SAVINGS_PROTO_PATH \
  --dart_out=grpc:lib/protos \
  $(find $SAVINGS_PROTO_PATH -iname "*.proto")