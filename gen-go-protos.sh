# shellcheck disable=SC2046
BACKEND_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/go-bank-server
PROTO_PATH=$BACKEND_PATH/protos

# generate for backend
cd $BACKEND_PATH || exit

mkdir -p "gen"

protoc --proto_path=$PROTO_PATH --go_out=$BACKEND_PATH/gen --go_opt=paths=source_relative \
  --go-grpc_out=$BACKEND_PATH/gen --go-grpc_opt=paths=source_relative \
  $(find $PROTO_PATH -iname "*.proto")
