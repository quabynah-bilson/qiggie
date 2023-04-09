import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, BlocState> {
  final _repo = getIt<BaseAuthRepository>();

  AuthBloc() : super(BlocState.initialState()) {
    on<UpdateAccountAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());

      var either = await _repo.updateAccount(event.account);
      either.fold(
        (l) => emit(BlocState<Account>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<LoginAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either =
          await _repo.login(username: event.username, password: event.password);
      either.fold(
        (l) => emit(BlocState<Account>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<LogoutAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.logout();
      either.fold(
        (l) => emit(BlocState<String>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetAccountAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getCurrentAccount();
      either.fold(
        (l) => emit(BlocState<Account>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<CreateAccountAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.createAccount(
          username: event.username,
          displayName: event.displayName,
          password: event.password,
          phoneNumber: event.phoneNumber);
      either.fold(
        (l) => emit(BlocState<Account>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<SendVerificationCodeAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.sendVerificationCode(event.phoneNumber);
      either.fold(
        (l) => emit(BlocState<AuthCodeResponse>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<VerifyCodeAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.verifyCode(
          phoneNumber: event.phoneNumber, code: event.code);
      either.fold(
        (l) => emit(BlocState<AuthCodeResponse>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<UpdatePasswordAuthEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.updatePassword(event.newPassword);
      either.fold(
        (l) => emit(BlocState<String>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }
}
