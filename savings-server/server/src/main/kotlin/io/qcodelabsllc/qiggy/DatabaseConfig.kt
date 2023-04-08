package io.qcodelabsllc.qiggy

import com.mongodb.ConnectionString
import com.mongodb.MongoClientSettings
import com.mongodb.reactivestreams.client.MongoClients
import com.mongodb.reactivestreams.client.MongoCollection
import io.github.cdimascio.dotenv.Dotenv
import org.bson.Document

object DatabaseConfig {
    lateinit var savingsCollection: MongoCollection<Document>

    fun initializeDb() {
        val dotenv = Dotenv.configure()
            .directory("${System.getProperty("user.dir")}/savings-server")
            .systemProperties()
            .load()
        val databaseUri = dotenv["DATABASE_URI"]
        val databaseName = dotenv["DATABASE_NAME"]
        val collectionName = dotenv["SAVINGS_COLLECTION"]
        val settings = MongoClientSettings.builder()
            .applyConnectionString(ConnectionString(databaseUri))
            .retryWrites(true)
            .build()
        val mongoClient = MongoClients.create(settings)
        val database = mongoClient.getDatabase(databaseName)
        savingsCollection = database.getCollection(collectionName)

    }
}