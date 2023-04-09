part of 'customer_bloc.dart';

abstract class CustomerEvent {
  const CustomerEvent();
}

class GetCurrentCustomerEvent extends CustomerEvent {}

class CreateCustomerEvent extends CustomerEvent {
  final String username;
  final String displayName;
  final String phoneNumber;
  final String? avatar;

  const CreateCustomerEvent({
    required this.username,
    required this.displayName,
    required this.phoneNumber,
    this.avatar,
  });
}
