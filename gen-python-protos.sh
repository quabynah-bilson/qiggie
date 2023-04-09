# shellcheck disable=SC2046
BACKEND_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/auth-server
PROTO_PATH=$BACKEND_PATH/protos


cd $BACKEND_PATH || exit;

#mkdir -p "gen"

python3 -m grpc_tools.protoc --proto_path=$PROTO_PATH --python_out=$BACKEND_PATH \
  --grpc_python_out=$BACKEND_PATH --experimental_allow_proto3_optional \
  $(find $PROTO_PATH -iname "*.proto")
