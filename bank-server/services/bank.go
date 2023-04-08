package services

import (
	"com.github/qcodelabsllc/qiggy/clients"
	"com.github/qcodelabsllc/qiggy/config"
	pb "com.github/qcodelabsllc/qiggy/gen"
	"context"
	"errors"
	"fmt"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"google.golang.org/grpc/codes"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/timestamppb"
	"google.golang.org/protobuf/types/known/wrapperspb"
	"log"
	"time"
)

type BankServiceServer struct {
	pb.UnimplementedQiggyBankServiceServer
}

func (s *BankServiceServer) CreateQiggyBank(ctx context.Context, request *pb.QiggyBank) (*wrapperspb.StringValue, error) {
	ctx, cancel := context.WithTimeout(ctx, time.Second*15)
	defer cancel()

	// get client service
	if server, err := clients.GetCustomerServer(); err != nil {
		return nil, errors.New(codes.Internal.String())
	} else {
		// get customer information
		if _, err := server.GetCustomer(ctx, &wrapperspb.StringValue{Value: request.GetCustomerId()}); err != nil {
			return nil, err
		}
		request.UpdatedAt = timestamppb.Now()
		request.CreatedAt = timestamppb.Now()

		if insertResult, err := config.BankCol.InsertOne(ctx, &request); err != nil {
			return nil, errors.New(codes.ResourceExhausted.String())
		} else {

			// run update in the background
			objectId := insertResult.InsertedID.(primitive.ObjectID).Hex()
			fmt.Println(objectId)
			go func(id string, req *pb.QiggyBank) {
				req.Id = id
				if _, err := config.BankCol.ReplaceOne(context.Background(), bson.M{"id": req.GetId()}, &req); err != nil {
					log.Printf("failed to update bank details%+v\n", err)
				}
			}(objectId, request)

			message := "Piggybank created successfully"
			return &wrapperspb.StringValue{
				Value: message,
			}, nil
		}
	}
}
func (s *BankServiceServer) GetQiggyBank(context.Context, *wrapperspb.StringValue) (*pb.QiggyBank, error) {
	return nil, nil
}
func (s *BankServiceServer) UpdateQiggyBank(context.Context, *pb.QiggyBank) (*emptypb.Empty, error) {
	return nil, nil
}
func (s *BankServiceServer) DeleteQiggyBank(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, nil
}
func (s *BankServiceServer) ListQiggyBanks(_ *emptypb.Empty, srv pb.QiggyBankService_ListQiggyBanksServer) error {
	response := &pb.QiggyBankList{}
	ctx := srv.Context()

	if cursor, err := config.BankCol.Find(ctx, bson.D{}); err == nil {
		var banks []*pb.QiggyBank
		_ = cursor.All(ctx, &banks)
		response.Banks = banks
		_ = srv.Send(response)

		// TODO: stream all banks for user
		/*pipeline, changeStreamOptions := utils.GetDefaultPipelineAndStreamOptions()
		if changeStream, err := config.BankCol.Watch(ctx, pipeline, changeStreamOptions); err != nil {
			return errors.New(codes.Unavailable.String())
		} else {
			ctx, cancel := context.WithDeadline(ctx, time.Now().Add(time.Minute*5))
			defer cancel()
			defer func(changeStream *mongo.ChangeStream, ctx context.Context) {
				_ = changeStream.Close(ctx)
			}(changeStream, ctx)

			filteredResults := response.GetBanks()
			for changeStream.Next(ctx) {
				var doc utils.MongoDocToProto[*pb.QiggyBank]
				_ = changeStream.Decode(&doc)

				switch doc.OperationType {
				case "replace":
					for i, bank := range response.GetBanks() {
						if bank.GetId() == doc.FullDocument.GetId() {
							filteredResults[i] = doc.FullDocument
						}
					}
					break
				case "update":
					for i, bank := range response.GetBanks() {
						if bank.GetId() == doc.FullDocument.GetId() {
							filteredResults[i] = doc.FullDocument
						}
					}
					break
				case "delete":
					for i, bank := range response.GetBanks() {
						if bank.GetId() == doc.FullDocument.GetId() {
							filteredResults = utils.RemoveIndex(filteredResults, i)
						}
					}
					break
				default:
					filteredResults = append(filteredResults, doc.FullDocument)
					break
				}

				response.Banks = filteredResults
				_ = srv.Send(response)
			}

		}*/
	}
	return nil
}
