// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'form_login_bloc.dart';

class FormLoginState extends Equatable {

  final String email;
  final String password;
  final GlobalKey<FormState> globalKeyFormLogin;

  FormLoginState({
    this.email = '',
    this.password = '',
    GlobalKey<FormState>? globalKeyFormLogin,
  }) : globalKeyFormLogin = globalKeyFormLogin ?? GlobalKey<FormState>();
  
  @override
  List<Object> get props => [email, password, globalKeyFormLogin];

  FormLoginState copyWith({
    String? email,
    String? password,
    GlobalKey<FormState>? globalKeyFormLogin,
  }) {
    return FormLoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      globalKeyFormLogin: globalKeyFormLogin ?? this.globalKeyFormLogin,
    );
  }
  
}
