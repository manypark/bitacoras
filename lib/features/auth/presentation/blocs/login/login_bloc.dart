import 'package:bitacoras/core/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/auth/domain/entities/user_entity.dart';
import 'package:bitacoras/features/auth/infrastructure/infrastructure.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final _loginRespository = LoginRepositoryImpl();

  LoginBloc() : super( LoginState() ) {
    on<PostLoginSuccess>( _postLoginHandler );
    on<PostLoginError>( _errorHandler );
  }

  Future<bool> postLogin( String email, String password ) async {

    final (err, responseLogin) = await _loginRespository.postLogin(email, password);

    if(err != null) {
      onErrorPost(err);
      return false;
    }

    add( PostLoginSuccess( userLogin: responseLogin.user ) );

    return true;
  }

  void onErrorPost( ErrorMessage? err ) {
    add( PostLoginError( errorMessage: err ) );
  }

  void _postLoginHandler( PostLoginSuccess event, Emitter<LoginState> emit) {
    emit(state.copyWith( userLogin: event.userLogin ) );
  }

  void _errorHandler( PostLoginError event, Emitter<LoginState> emit) {
    emit(state.copyWith( errorMessage: event.errorMessage ) );
  }

}
