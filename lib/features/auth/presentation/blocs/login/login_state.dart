part of 'login_bloc.dart';

class LoginState extends Equatable {

  final User? userLogin;

  const LoginState({ this.userLogin });
  
  @override
  List<Object?> get props => [userLogin];

  LoginState copyWith({
    User? userLogin,
  }) {
    return LoginState(
      userLogin: userLogin ?? this.userLogin,
    );
  }
}
