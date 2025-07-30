part of 'theme_cubit.dart';

class ThemeState extends Equatable {

  final bool isDark;

  const ThemeState({ this.isDark = false, });

  @override
  List<Object> get props => [isDark];

  ThemeState copyWith({ bool? isDark }) => ThemeState( isDark: isDark ?? this.isDark );

  static Map<String, dynamic> toMap( ThemeState state ) {
    return <String, dynamic> { 'isDark' : state.isDark };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState( isDark: map['isDark'] ?? false );
  }

}

final class ThemeInitial extends ThemeState {}
