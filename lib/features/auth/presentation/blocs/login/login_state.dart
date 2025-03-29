part of 'login_bloc.dart';

class LoginState extends Equatable {

  final User? userLogin;
  final String accesToken;
  final ErrorMessage? errorMessage;

  const LoginState({ 
    this.userLogin, 
    this.errorMessage,
    this.accesToken = ''
  });
  
  @override
  List<Object?> get props => [userLogin, errorMessage, accesToken];

  LoginState copyWith({
    User? userLogin,
    String? accesToken,
    ErrorMessage? errorMessage,
  }) => LoginState(
    userLogin   : userLogin ?? this.userLogin,
    accesToken  : accesToken ?? this.accesToken,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  factory LoginState.fromMap(Map<String, dynamic> map) {
    return LoginState(
      userLogin   : map['userLogin'] != null ? User.fromMap(map['userLogin'] as Map<String,dynamic>) : null,
      errorMessage: map['errorMessage'] != null ? ErrorMessage.fromMap(map['errorMessage'] as Map<String,dynamic>) : null,
      accesToken  : map['accesToken'] ?? '',
    );
  }

  static Map<String, dynamic> toMap( LoginState state ) {
    return <String, dynamic>{
      'userLogin'   : state.userLogin?.toMap(),
      'errorMessage': state.errorMessage?.toMap(),
      'accesToken'  : state.accesToken,
    };
  }

}
