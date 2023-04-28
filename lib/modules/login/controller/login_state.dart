part of 'login_cubit.dart';

enum StatusLogin {initial, loading, success, failure}

class LoginState extends Equatable{
  final StatusLogin statusLogin;
  @override
  List<Object?> get props => [statusLogin];

  const LoginState({
    required this.statusLogin,
  });

  LoginState copyWith({
    StatusLogin? statusLogin,
  }) {
    return LoginState(
      statusLogin: statusLogin ?? this.statusLogin,
    );
  }
}
