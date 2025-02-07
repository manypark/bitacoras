import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';

part 'form_login_event.dart';
part 'form_login_state.dart';

class FormLoginBloc extends Bloc<FormLoginEvent, FormLoginState> {

  final loginBloc = LoginBloc();

  FormLoginBloc() : super(FormLoginState()) {
    on<FormLoginOnChangeEmail>( _onChangeEmailHandler );
    on<FormLoginOnChangePassword>( _onChangePasswordHandler );
  }

  void onChangeEmail( String email ) {
    add(FormLoginOnChangeEmail( email:email ));
  }

  void onChangePassword( String password ) {
    add(FormLoginOnChangePassword( password:password ));
  }

  Future<bool> onSubmit() async {

    if( state.globalKeyFormLogin.currentState!.validate() ) {

      final response = await loginBloc.postLogin(state.email, state.password);

      state.globalKeyFormLogin.currentState?.reset();

      return response;
    }


    return false;
  }

  void _onChangeEmailHandler(FormLoginOnChangeEmail event, Emitter<FormLoginState> emit) {
    emit( state.copyWith( email: event.email ) );
  }

  void _onChangePasswordHandler(FormLoginOnChangePassword event, Emitter<FormLoginState> emit) {
    emit( state.copyWith( password: event.password ) );
  }

}
