import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';

part 'form_login_event.dart';
part 'form_login_state.dart';

class FormLoginBloc extends Bloc<FormLoginEvent, FormLoginState> {

  FormLoginBloc() : super(FormLoginState()) {
    on<FormLoginOnChangeEmail>( _onChangeEmailHandler );
    on<FormLoginOnChangePassword>( _onChangePasswordHandler );
    on<FormLoginIsLoading>( _onIsLoadingHandler );
  }

  void onChangeEmail( String email ) {
    add(FormLoginOnChangeEmail( email:email ));
  }

  void onChangePassword( String password ) {
    add(FormLoginOnChangePassword( password:password ));
  }

  void onIsLoading( bool value ) {
    add(FormLoginIsLoading( isLoading:value ));
  }

  Future<bool> onSubmit( BuildContext context ) async {

    if( state.globalKeyFormLogin.currentState!.validate() ) {

      onIsLoading(true);
      final response = await context.read<LoginBloc>().postLogin(state.email, state.password);

      state.globalKeyFormLogin.currentState?.reset();

      onIsLoading(false);
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

  void _onIsLoadingHandler(FormLoginIsLoading event, Emitter<FormLoginState> emit) {
    emit( state.copyWith( isLoading: event.isLoading ) );
  }

}
