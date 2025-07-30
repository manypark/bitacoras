import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {

  ThemeCubit() : super(ThemeInitial());

  void toggleTheme() => emit( state.copyWith( isDark: !state.isDark ) );
  
  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap( json );
  }
  
  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return ThemeState.toMap(state);
  }

}
