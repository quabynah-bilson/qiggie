gen-protos-bank:
	./gen-go-protos.sh

gen-protos-savings:
	./gen-ruby-protos.sh

gen-protos-mobile:
	./gen-dart-protos.sh

mobile-deps:
	cd mobile && \
	flutter pub add grpc protobuf_google protobuf bloc flutter_bloc injectable get_it auto_route google_fonts lottie && \
	flutter pub add --dev build_runner auto_route_generator injectable_generator && \
	flutter pub upgrade --major-versions

#server = GRPC::RpcServer.new
 #server.add_http2_port('0.0.0.0:1151', :this_port_is_insecure)
 #server.handle(SavingsServer.new)
 #server.run_till_terminated