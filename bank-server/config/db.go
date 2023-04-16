package config

import (
	"context"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"log"
	"os"
	"time"
)

var BankCol *mongo.Collection

func InitDatabaseConnection() {
	databaseUri := os.Getenv("DATABASE_URI")
	bankCollection := os.Getenv("BANK_COLLECTION")
	databaseName := os.Getenv("DATABASE_NAME")
	serverAPIOptions := options.ServerAPI(options.ServerAPIVersion1)
	clientOptions := options.Client().
		ApplyURI(databaseUri).
		SetServerAPIOptions(serverAPIOptions)
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	if client, err := mongo.Connect(ctx, clientOptions); err != nil {
		log.Fatal(err)
	} else {
		BankCol = client.Database(databaseName).Collection(bankCollection)
	}
}
