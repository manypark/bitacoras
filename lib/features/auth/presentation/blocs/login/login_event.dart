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

class PostLoginError extends LoginEvent {

  final ErrorMessage? errorMessage;
  
  const PostLoginError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
  
}
