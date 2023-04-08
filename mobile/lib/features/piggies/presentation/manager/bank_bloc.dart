import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/piggies/domain/repositories/bank.dart';
import 'package:mobile/protos/bank.pb.dart';
import 'package:shared_utils/shared_utils.dart';

part 'bank_event.dart';

/// bank bloc
class BankBloc extends Bloc<BankEvent, BlocState> {
  final _repo = getIt<BaseBankRepository>();

  BankBloc() : super(BlocState.initialState()) {
    on<GetQiggiesBankEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getQiggies();
      either.fold(
        (l) => emit(BlocState<Stream<List<QiggyBank>>>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<SaveQiggyBankEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.saveQiggyBank(
          name: event.name,
          goalAmount: event.goalAmount,
          initialAmount: event.initialAmount);
      either.fold(
        (l) => emit(BlocState<String>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<DeleteQiggyBankEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.deleteQiggyBank(event.id);
      either.fold(
        (l) => emit(BlocState<String>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }
}
