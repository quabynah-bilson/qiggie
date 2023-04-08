# shellcheck disable=SC2046
BACKEND_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/auth-server
CUSTOMER_PROTO_PATH=/Users/quabynah/src/projects/personal-studies/piggybank/customer-server/protos
PROTO_PATH=$BACKEND_PATH/protos


cd $BACKEND_PATH || exit;

#mkdir -p "gen"

python3 -m grpc_tools.protoc --proto_path=$PROTO_PATH --python_out=$BACKEND_PATH \
  --grpc_python_out=$BACKEND_PATH \
  $(find $PROTO_PATH -iname "*.proto")

python3 -m grpc_tools.protoc --proto_path=$CUSTOMER_PROTO_PATH --python_out=$BACKEND_PATH \
  --grpc_python_out=$BACKEND_PATH \
  $(find $CUSTOMER_PROTO_PATH -iname "*.proto")