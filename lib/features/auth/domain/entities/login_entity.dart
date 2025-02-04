import 'user_entity.dart';

class LogInEntitie {

    final String accessToken;
    final String tokenType;
    final int expiresIn;
    final int expiresAt;
    final String refreshToken;
    final User? user;

    LogInEntitie({
        this.user,
        required this.accessToken,
        required this.tokenType,
        required this.expiresIn,
        required this.expiresAt,
        required this.refreshToken,
    });

}
