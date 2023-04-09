import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/shared/domain/repositories/customer.dart';
import 'package:mobile/protos/customer.pb.dart';
import 'package:shared_utils/shared_utils.dart';

part 'customer_event.dart';

class CustomerBloc extends Bloc<CustomerEvent, BlocState> {
  final _repo = getIt<BaseCustomerRepository>();

  CustomerBloc() : super(BlocState.initialState()) {
    on<GetCurrentCustomerEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getCurrentCustomer();
      either.fold(
        (l) => emit(BlocState<Stream<Customer>>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<CreateCustomerEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.createCustomer(
          username: event.username,
          displayName: event.displayName,
          phoneNumber: event.phoneNumber,
          avatar: event.avatar);
      either.fold(
        (l) => emit(BlocState<String>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<CustomerEvent>((event, emit) async {
      emit(BlocState.loadingState());
      // TODO: implement event handler
    });
  }
}
