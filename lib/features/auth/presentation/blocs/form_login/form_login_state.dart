// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'form_login_bloc.dart';

class FormLoginState extends Equatable {

  final String email;
  final String password;
  final bool isLoading;
  final GlobalKey<FormState> globalKeyFormLogin = GlobalKey<FormState>();

  FormLoginState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
  });
  
  @override
  List<Object> get props => [email, password, globalKeyFormLogin, isLoading];

  FormLoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    GlobalKey<FormState>? globalKeyFormLogin,
  }) {
    return FormLoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
  
}
