// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {

  final User? userLogin;
  final ErrorMessage? errorMessage;

  const LoginState({ this.userLogin, this.errorMessage });
  
  @override
  List<Object?> get props => [userLogin, errorMessage];

  LoginState copyWith({
    User? userLogin,
    ErrorMessage? errorMessage,
  }) {
    return LoginState(
      userLogin: userLogin ?? this.userLogin,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
