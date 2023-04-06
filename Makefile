gen-protos-bank:
	./gen-go-protos.sh

gen-protos-mobile:
	./gen-dart-protos.sh

mobile-deps:
	cd mobile && \
	flutter pub add grpc protobuf_google bloc flutter_bloc injectable get_it auto_route google_fonts && \
	flutter pub add --dev build_runner auto_route_generator injectable_generator && \
	flutter pub upgrade --major-versions
