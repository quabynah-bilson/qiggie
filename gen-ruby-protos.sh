# shellcheck disable=SC2046
BACKEND_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/savings-server
PROTO_PATH=$BACKEND_PATH/protos

# generate for backend
cd $BACKEND_PATH || exit

mkdir -p "lib/gen"

grpc_tools_ruby_protoc --ruby_out=$BACKEND_PATH/lib/gen --grpc_out=$BACKEND_PATH/lib/gen --proto_path=$PROTO_PATH \
  $(find $PROTO_PATH -iname "*.proto")
