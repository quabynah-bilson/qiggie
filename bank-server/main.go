package main

import (
	"com.github/qcodelabsllc/qiggy/config"
	pb "com.github/qcodelabsllc/qiggy/gen"
	svc "com.github/qcodelabsllc/qiggy/services"
	"github.com/joho/godotenv"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"log"
	"net"
)

func main() {
	// This line loads the environment variables from the ".env" file.
	_ = godotenv.Load()

	// initialize database connection
	config.InitDatabaseConnection()

	// setup grpc server
	s := grpc.NewServer()
	pb.RegisterQiggyBankServiceServer(s, &svc.BankServiceServer{})
	reflection.Register(s)

	// run server
	if lis, err := net.Listen("tcp", ":1150"); err == nil {
		log.Printf("started bank grpc server on: %+v\n", lis.Addr())
		if err := s.Serve(lis); err != nil {
			log.Fatalf("unable to start grpc server: %+v\n", err)
		}
	}
}
