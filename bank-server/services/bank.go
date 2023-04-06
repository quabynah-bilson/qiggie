package services

import (
	pb "com.github/qcodelabsllc/piggybank/gen"
	"context"
	"github.com/google/uuid"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/timestamppb"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

type BankServiceServer struct {
	pb.UnimplementedPiggyBankServiceServer
}

func (s *BankServiceServer) CreatePiggyBank(context.Context, *pb.PiggyBank) (*wrapperspb.StringValue, error) {

	return nil, nil
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
	response.Banks = append(response.GetBanks(), &pb.PiggyBank{
		Id:            uuid.NewString(),
		CustomerId:    uuid.NewString(),
		GoalAmount:    15000,
		CurrentAmount: 1233,
		Description:   "Saving for future companies",
		CreatedAt:     timestamppb.Now(),
		UpdatedAt:     timestamppb.Now(),
	})
	_ = srv.Send(response)
	return nil
}
