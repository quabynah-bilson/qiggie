# shellcheck disable=SC2046
BACKEND_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/bank-server
PROTO_PATH=$BACKEND_PATH/protos
CUSTOMER_PROTO_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/customer-server/protos
AUTH_PROTO_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/auth-server/protos

# generate for backend
cd $BACKEND_PATH || exit

mkdir -p "gen"

protoc --proto_path=$PROTO_PATH --go_out=$BACKEND_PATH/gen --go_opt=paths=source_relative \
  --go-grpc_out=$BACKEND_PATH/gen --go-grpc_opt=paths=source_relative \
  $(find $PROTO_PATH -iname "*.proto")

protoc --proto_path=$CUSTOMER_PROTO_PATH --go_out=$BACKEND_PATH/gen --go_opt=paths=source_relative \
  --go-grpc_out=$BACKEND_PATH/gen --go-grpc_opt=paths=source_relative \
  $(find $CUSTOMER_PROTO_PATH -iname "*.proto")
  
protoc --proto_path=$AUTH_PROTO_PATH --go_out=$BACKEND_PATH/gen --go_opt=paths=source_relative \
  --go-grpc_out=$BACKEND_PATH/gen --go-grpc_opt=paths=source_relative \
  $(find $AUTH_PROTO_PATH -iname "*.proto")
