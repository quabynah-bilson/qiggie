package io.qcodelabsllc.piggybank.services

import com.google.protobuf.StringValue
import com.google.protobuf.stringValue
import com.google.protobuf.timestamp
import io.qcodelabsllc.piggybank.*
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.channelFlow
import java.util.*


class SavingsServiceImpl : SavingsServiceGrpcKt.SavingsServiceCoroutineImplBase() {

    override suspend fun addSavings(requests: Flow<Savings>): StringValue = stringValue {

        requests.collect { savings ->
            value = "You're saving this much: \$${savings.amount}"

//            DatabaseConfig.savingsCollection.insertOne(null)
        }
    }

    override suspend fun getSavings(request: StringValue): Savings = savings {
        // TODO -> get savings details from database
        id = UUID.randomUUID().toString()
        amount = 1212.12
        piggybankId = UUID.randomUUID().toString()
        transactionDate = timestamp {
            seconds = System.currentTimeMillis()
        }
    }

    override fun listSavings(request: ListSavingsRequest): Flow<SavingsResponse> = channelFlow {
        // TODO -> get data from database in streams
//        DatabaseConfig.run { savingsCollection.find().first() }
        val sampleSavings = savings {
            id = UUID.randomUUID().toString()
            amount = 1212.12
            piggybankId = UUID.randomUUID().toString()
            transactionDate = timestamp {
                seconds = System.currentTimeMillis()
            }
        }
        val response = savingsResponse {
            savings.add(sampleSavings)
        }
        send(response)

        awaitClose { println("channel closed for streaming #listSavings") }
    }
}