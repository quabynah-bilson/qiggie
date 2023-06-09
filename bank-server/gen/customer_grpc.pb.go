// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v3.15.8
// source: customer.proto

package ms

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
	wrapperspb "google.golang.org/protobuf/types/known/wrapperspb"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// CustomerServiceClient is the client API for CustomerService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type CustomerServiceClient interface {
	CreateCustomer(ctx context.Context, in *Customer, opts ...grpc.CallOption) (*wrapperspb.StringValue, error)
	GetCustomer(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*Customer, error)
	UpdateCustomer(ctx context.Context, in *Customer, opts ...grpc.CallOption) (*emptypb.Empty, error)
	DeleteCustomer(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error)
	GetCurrentCustomer(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (CustomerService_GetCurrentCustomerClient, error)
}

type customerServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewCustomerServiceClient(cc grpc.ClientConnInterface) CustomerServiceClient {
	return &customerServiceClient{cc}
}

func (c *customerServiceClient) CreateCustomer(ctx context.Context, in *Customer, opts ...grpc.CallOption) (*wrapperspb.StringValue, error) {
	out := new(wrapperspb.StringValue)
	err := c.cc.Invoke(ctx, "/customer.CustomerService/CreateCustomer", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *customerServiceClient) GetCustomer(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*Customer, error) {
	out := new(Customer)
	err := c.cc.Invoke(ctx, "/customer.CustomerService/GetCustomer", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *customerServiceClient) UpdateCustomer(ctx context.Context, in *Customer, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/customer.CustomerService/UpdateCustomer", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *customerServiceClient) DeleteCustomer(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/customer.CustomerService/DeleteCustomer", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *customerServiceClient) GetCurrentCustomer(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (CustomerService_GetCurrentCustomerClient, error) {
	stream, err := c.cc.NewStream(ctx, &CustomerService_ServiceDesc.Streams[0], "/customer.CustomerService/GetCurrentCustomer", opts...)
	if err != nil {
		return nil, err
	}
	x := &customerServiceGetCurrentCustomerClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type CustomerService_GetCurrentCustomerClient interface {
	Recv() (*Customer, error)
	grpc.ClientStream
}

type customerServiceGetCurrentCustomerClient struct {
	grpc.ClientStream
}

func (x *customerServiceGetCurrentCustomerClient) Recv() (*Customer, error) {
	m := new(Customer)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

// CustomerServiceServer is the server API for CustomerService service.
// All implementations must embed UnimplementedCustomerServiceServer
// for forward compatibility
type CustomerServiceServer interface {
	CreateCustomer(context.Context, *Customer) (*wrapperspb.StringValue, error)
	GetCustomer(context.Context, *wrapperspb.StringValue) (*Customer, error)
	UpdateCustomer(context.Context, *Customer) (*emptypb.Empty, error)
	DeleteCustomer(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error)
	GetCurrentCustomer(*emptypb.Empty, CustomerService_GetCurrentCustomerServer) error
	mustEmbedUnimplementedCustomerServiceServer()
}

// UnimplementedCustomerServiceServer must be embedded to have forward compatible implementations.
type UnimplementedCustomerServiceServer struct {
}

func (UnimplementedCustomerServiceServer) CreateCustomer(context.Context, *Customer) (*wrapperspb.StringValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateCustomer not implemented")
}
func (UnimplementedCustomerServiceServer) GetCustomer(context.Context, *wrapperspb.StringValue) (*Customer, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetCustomer not implemented")
}
func (UnimplementedCustomerServiceServer) UpdateCustomer(context.Context, *Customer) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateCustomer not implemented")
}
func (UnimplementedCustomerServiceServer) DeleteCustomer(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteCustomer not implemented")
}
func (UnimplementedCustomerServiceServer) GetCurrentCustomer(*emptypb.Empty, CustomerService_GetCurrentCustomerServer) error {
	return status.Errorf(codes.Unimplemented, "method GetCurrentCustomer not implemented")
}
func (UnimplementedCustomerServiceServer) mustEmbedUnimplementedCustomerServiceServer() {}

// UnsafeCustomerServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to CustomerServiceServer will
// result in compilation errors.
type UnsafeCustomerServiceServer interface {
	mustEmbedUnimplementedCustomerServiceServer()
}

func RegisterCustomerServiceServer(s grpc.ServiceRegistrar, srv CustomerServiceServer) {
	s.RegisterService(&CustomerService_ServiceDesc, srv)
}

func _CustomerService_CreateCustomer_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Customer)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(CustomerServiceServer).CreateCustomer(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/customer.CustomerService/CreateCustomer",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(CustomerServiceServer).CreateCustomer(ctx, req.(*Customer))
	}
	return interceptor(ctx, in, info, handler)
}

func _CustomerService_GetCustomer_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(CustomerServiceServer).GetCustomer(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/customer.CustomerService/GetCustomer",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(CustomerServiceServer).GetCustomer(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _CustomerService_UpdateCustomer_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Customer)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(CustomerServiceServer).UpdateCustomer(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/customer.CustomerService/UpdateCustomer",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(CustomerServiceServer).UpdateCustomer(ctx, req.(*Customer))
	}
	return interceptor(ctx, in, info, handler)
}

func _CustomerService_DeleteCustomer_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(CustomerServiceServer).DeleteCustomer(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/customer.CustomerService/DeleteCustomer",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(CustomerServiceServer).DeleteCustomer(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _CustomerService_GetCurrentCustomer_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(emptypb.Empty)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(CustomerServiceServer).GetCurrentCustomer(m, &customerServiceGetCurrentCustomerServer{stream})
}

type CustomerService_GetCurrentCustomerServer interface {
	Send(*Customer) error
	grpc.ServerStream
}

type customerServiceGetCurrentCustomerServer struct {
	grpc.ServerStream
}

func (x *customerServiceGetCurrentCustomerServer) Send(m *Customer) error {
	return x.ServerStream.SendMsg(m)
}

// CustomerService_ServiceDesc is the grpc.ServiceDesc for CustomerService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var CustomerService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "customer.CustomerService",
	HandlerType: (*CustomerServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateCustomer",
			Handler:    _CustomerService_CreateCustomer_Handler,
		},
		{
			MethodName: "GetCustomer",
			Handler:    _CustomerService_GetCustomer_Handler,
		},
		{
			MethodName: "UpdateCustomer",
			Handler:    _CustomerService_UpdateCustomer_Handler,
		},
		{
			MethodName: "DeleteCustomer",
			Handler:    _CustomerService_DeleteCustomer_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "GetCurrentCustomer",
			Handler:       _CustomerService_GetCurrentCustomer_Handler,
			ServerStreams: true,
		},
	},
	Metadata: "customer.proto",
}
