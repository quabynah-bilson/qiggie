package clients

import (
	pb "com.github/qcodelabsllc/piggybank/gen"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func GetCustomerServer() (pb.CustomerServiceClient, error) {
	if conn, err := grpc.Dial("0.0.0.0:1149", grpc.WithTransportCredentials(insecure.NewCredentials())); err != nil {
		return nil, err
	} else {
		client := pb.NewCustomerServiceClient(conn)
		return client, nil
	}
}
