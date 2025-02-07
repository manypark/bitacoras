part of 'form_login_bloc.dart';

sealed class FormLoginEvent extends Equatable { const FormLoginEvent(); }


class FormLoginOnChangeEmail extends FormLoginEvent {

  final String email;

  const FormLoginOnChangeEmail({ this.email = ''});

  @override
  List<Object> get props => [ email ];
  
}

class FormLoginOnChangePassword extends FormLoginEvent {

  final String password;

  const FormLoginOnChangePassword({ this.password = ''});

  @override
  List<Object> get props => [ password ];
  
}
