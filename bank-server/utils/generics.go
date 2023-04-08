package utils

import (
	"fmt"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func SliceContains[T comparable](s []T, str T) bool {
	for _, v := range s {
		if v == str {
			return true
		}
	}

	return false
}

// RemoveIndex => removes an item from a list
func RemoveIndex[T any](s []T, i int) []T {
	// check if the index is within array bounds
	if i < 0 || i >= len(s) {
		fmt.Println("The given index is out of bounds.")
		return s
	} else {
		// delete an element from the array
		newLength := 0
		for index := range s {
			if i != index {
				s[newLength] = s[index]
				newLength++
			}
		}

		// reslice the array to remove extra index
		newArray := s[:newLength]
		return newArray
	}
}

// MongoDocToProto => helper generic struct to convert full document to proto
type MongoDocToProto[T any] struct {
	FullDocument  T
	OperationType string
}

// GetDefaultPipelineAndStreamOptions => option for updating streams of documents from a collection
func GetDefaultPipelineAndStreamOptions() (mongo.Pipeline, *options.ChangeStreamOptions) {
	streamOptions := options.ChangeStream().SetFullDocument(options.UpdateLookup)
	//filter := bson.D{{"updatedat", -1}}
	return mongo.Pipeline{}, streamOptions
}
