// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class PostLoginSuccess extends LoginEvent {

  final User? userLogin;
  final String accesToken;
  
  const PostLoginSuccess({
    required this.userLogin,
    required this.accesToken,
  });

  @override
  List<Object?> get props => [userLogin, accesToken];
  
}

class UpdateRefreshToken extends LoginEvent {

  final String accesToken;

  const UpdateRefreshToken({ required this.accesToken });

  @override
  List<Object?> get props => [accesToken];

}

class PostLoginError extends LoginEvent {

  final ErrorMessage? errorMessage;
  
  const PostLoginError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
  
}
