package io.qcodelabsllc.qiggy

import io.grpc.Server
import io.grpc.ServerBuilder
import io.qcodelabsllc.qiggy.services.SavingsServiceImpl

class PiggyBankSavingServer(private val port: Int) {

    private val server: Server = ServerBuilder.forPort(port)
        .addService(SavingsServiceImpl())
        .build()

    fun serve() {
        // initialize database connection
        DatabaseConfig.initializeDb()

        // start grpc server
        server.start()
        println("started savings grpc server on $port")
        Runtime.getRuntime().addShutdownHook(
            Thread {
                println("*** shutting down gRPC server since JVM is shutting down")
                this@PiggyBankSavingServer.stop()
                println("*** server shut down")
            }
        )
    }

    private fun stop() {
        server.shutdown()
    }

    fun blockUntilShutdown() {
        server.awaitTermination()
    }
}

fun main() {
    val port = 1148
    val server = PiggyBankSavingServer(port)
    server.serve()
    server.blockUntilShutdown()
}