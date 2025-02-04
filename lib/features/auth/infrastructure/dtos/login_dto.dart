import 'user_dto.dart';

class LogInDto {

    final String accessToken;
    final String tokenType;
    final int expiresIn;
    final int expiresAt;
    final String refreshToken;
    final UserDto? user;

    LogInDto({
        this.user,
        required this.accessToken,
        required this.tokenType,
        required this.expiresIn,
        required this.expiresAt,
        required this.refreshToken,
    });

  factory LogInDto.fromMap(Map<String, dynamic> map) {
    return LogInDto(
      accessToken: map['access_token'] as String,
      tokenType: map['token_type'] as String,
      expiresIn: map['expires_in'] as int,
      expiresAt: map['expires_at'] as int,
      refreshToken: map['refresh_token'] as String,
      user: map['user'] != null ? UserDto.fromMap(map['user']) : null,
    );
  }

}
