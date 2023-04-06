plugins {
    id("com.google.protobuf") version "0.8.18" apply false
    kotlin("jvm") version "1.8.20" apply false
}

ext["grpcVersion"] = "1.47.0"
ext["grpcKotlinVersion"] = "1.3.0" // CURRENT_GRPC_KOTLIN_VERSION
ext["protobufVersion"] = "3.21.2"
ext["coroutinesVersion"] = "1.6.2"

allprojects {
    repositories {
        mavenLocal()
        mavenCentral()
        google()
    }
}