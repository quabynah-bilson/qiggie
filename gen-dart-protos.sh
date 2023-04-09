# shellcheck disable=SC2046
BANK_PROTO_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/bank-server/protos
CUSTOMER_PROTO_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/customer-server/protos
SAVINGS_PROTO_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/savings-server/protos/src/main/proto/io/qcodelabsllc/qiggy
AUTH_PROTO_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/auth-server/protos

# generate for mobile
cd /Users/quabynah/src/projects/personal-studies/piggybank/mobile || exit
#protoc -I=$BANK_PROTO_PATH \
#  --dart_out=grpc:lib/protos \
#  $(find $BANK_PROTO_PATH -iname "*.proto")
#
#protoc -I=$CUSTOMER_PROTO_PATH \
#  --dart_out=grpc:lib/protos \
#  $(find $CUSTOMER_PROTO_PATH -iname "*.proto")
#
#protoc -I=$SAVINGS_PROTO_PATH \
#  --dart_out=grpc:lib/protos \
#  $(find $SAVINGS_PROTO_PATH -iname "*.proto")

protoc -I=$AUTH_PROTO_PATH \
  --dart_out=grpc:lib/protos \
  $(find $AUTH_PROTO_PATH -iname "*.proto")
