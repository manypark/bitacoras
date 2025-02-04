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
  }

  Future<void> postLogin( String email, String password ) async {

    final (err, responseLogin) = await _loginRespository.postLogin(email, password);

    add( PostLoginSuccess(userLogin: responseLogin.user) );
  }

  void _postLoginHandler( PostLoginSuccess event, Emitter<LoginState> emit) {
    emit(state.copyWith(userLogin: event.userLogin) );
  }

}
