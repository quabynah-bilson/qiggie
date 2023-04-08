plugins {
    application
    kotlin("jvm")
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(11))
    }
}

group = "io.qcodelabsllc.qiggy"
version = "0.0.0-alpha"

dependencies {
    implementation(project(":stub"))
    runtimeOnly("io.grpc:grpc-netty:${rootProject.ext["grpcVersion"]}")
    implementation("org.mongodb:mongodb-driver-reactivestreams:4.9.0")
    implementation("io.github.cdimascio:dotenv-kotlin:6.4.1")
    implementation("org.apache.logging.log4j:log4j-slf4j-impl:2.17.1")
    testImplementation(platform("org.junit:junit-bom:5.9.1"))
    testImplementation("org.junit.jupiter:junit-jupiter")
}

tasks.test {
    useJUnitPlatform()
}