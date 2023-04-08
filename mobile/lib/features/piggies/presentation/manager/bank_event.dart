part of 'bank_bloc.dart';

abstract class BankEvent {
  const BankEvent();
}

class GetQiggiesBankEvent extends BankEvent {}

class SaveQiggyBankEvent extends BankEvent {
  final String name;
  final double goalAmount;
  final double initialAmount;

  const SaveQiggyBankEvent({
    required this.name,
    required this.goalAmount,
    required this.initialAmount,
  });
}

class DeleteQiggyBankEvent extends BankEvent {
  final String id;

  const DeleteQiggyBankEvent(this.id);
}
