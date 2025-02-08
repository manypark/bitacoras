import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/domain/usecase/usecase.dart';
import 'package:bitacoras/features/auth/config/constants/constants.dart';
import 'package:bitacoras/features/auth/domain/entities/user_entity.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>  with HydratedMixin {

  final _loginUseCase = LoginUserCase();

  LoginBloc() : super( LoginState() ) {
    hydrate();
    on<PostLoginSuccess>( _postLoginHandler );
    on<PostLoginError>( _errorHandler );
  }

  Future<bool> postLogin( String email, String password ) async {

    final (err, responseLogin) = await _loginUseCase(email, password);

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
    emit(state.copyWith( userLogin: event.userLogin, errorMessage: ErrorMessage(code: 0, error_code: '', msg: '') ) );
  }

  void _errorHandler( PostLoginError event, Emitter<LoginState> emit) {
    emit(state.copyWith( errorMessage: event.errorMessage, userLogin: userError ) );
  }
  
  @override
  LoginState? fromJson(Map<String, dynamic> json) {
    return LoginState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(LoginState state) {
    return LoginState.toMap(state);
  }

}
