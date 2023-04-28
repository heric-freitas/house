import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../shared/constants/number_constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(statusLogin: StatusLogin.initial));

  Future<void> login({required String username, required String password}) async {
    try {
      emit(state.copyWith(statusLogin: StatusLogin.loading));
      await Future.delayed(const Duration(seconds: NumberConstants.delay));
      emit(state.copyWith(statusLogin: StatusLogin.success));
    } catch (e) {
      emit(state.copyWith(statusLogin: StatusLogin.failure));
    }
  }
}
