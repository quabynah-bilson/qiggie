package main

import (
	pb "com.github/qcodelabsllc/piggybank/gen"
	svc "com.github/qcodelabsllc/piggybank/services"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"log"
	"net"
)

func main() {
	s := grpc.NewServer()
	pb.RegisterPiggyBankServiceServer(s, &svc.BankServiceServer{})
	reflection.Register(s)

	if lis, err := net.Listen("tcp", ":1150"); err == nil {
		log.Printf("started bank grpc server on: %+v\n", lis.Addr())
		if err := s.Serve(lis); err != nil {
			log.Fatalf("unable to start grpc server: %+v\n", err)
		}
	}
}
