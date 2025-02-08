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

  factory LoginState.fromMap(Map<String, dynamic> map) {
    return LoginState(
      userLogin   : map['userLogin'] != null ? User.fromMap(map['userLogin'] as Map<String,dynamic>) : null,
      errorMessage: map['errorMessage'] != null ? ErrorMessage.fromMap(map['errorMessage'] as Map<String,dynamic>) : null,
    );
  }

  static Map<String, dynamic> toMap( LoginState state ) {
    return <String, dynamic>{
      'userLogin'   : state.userLogin?.toMap(),
      'errorMessage': state.errorMessage?.toMap(),
    };
  }

}
