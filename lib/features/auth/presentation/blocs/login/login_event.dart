part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class PostLoginSuccess extends LoginEvent {

  final User? userLogin;
  
  const PostLoginSuccess({required this.userLogin});

  @override
  List<Object?> get props => [userLogin];
  
}

class PostLoginError extends LoginEvent {

  final ErrorMessage? errorMessage;
  
  const PostLoginError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
  
}
