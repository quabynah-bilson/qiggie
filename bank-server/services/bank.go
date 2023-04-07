package services

import (
	"com.github/qcodelabsllc/piggybank/clients"
	"com.github/qcodelabsllc/piggybank/config"
	pb "com.github/qcodelabsllc/piggybank/gen"
	"context"
	"errors"
	"go.mongodb.org/mongo-driver/bson"
	"google.golang.org/grpc/codes"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/timestamppb"
	"google.golang.org/protobuf/types/known/wrapperspb"
	"time"
)

type BankServiceServer struct {
	pb.UnimplementedPiggyBankServiceServer
}

func (s *BankServiceServer) CreatePiggyBank(ctx context.Context, request *pb.PiggyBank) (*wrapperspb.StringValue, error) {
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
		request.CurrentAmount = 0
		request.UpdatedAt = timestamppb.Now()
		request.CreatedAt = timestamppb.Now()

		if _, err := config.BankCol.InsertOne(ctx, &request); err != nil {
			return nil, errors.New(codes.ResourceExhausted.String())
		} else {
			message := "Piggybank created successfully"
			return &wrapperspb.StringValue{
				Value: message,
			}, nil
		}
	}
}
func (s *BankServiceServer) GetPiggyBank(context.Context, *wrapperspb.StringValue) (*pb.PiggyBank, error) {
	return nil, nil
}
func (s *BankServiceServer) UpdatePiggyBank(context.Context, *pb.PiggyBank) (*emptypb.Empty, error) {
	return nil, nil
}
func (s *BankServiceServer) DeletePiggyBank(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, nil
}
func (s *BankServiceServer) ListPiggyBanks(_ *emptypb.Empty, srv pb.PiggyBankService_ListPiggyBanksServer) error {
	response := &pb.PiggyBankList{}
	ctx := srv.Context()

	// TODO: get all banks for user
	if cursor, err := config.BankCol.Find(ctx, bson.D{}); err == nil {
		var banks []*pb.PiggyBank
		_ = cursor.All(ctx, &banks)
		response.Banks = banks

		// TODO: start streaming data
		//config.BankCol.Watch(ctx, )
	}

	_ = srv.Send(response)
	return nil
}
