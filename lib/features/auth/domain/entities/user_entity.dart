import 'identity_entity.dart';
import 'app_metadata_entity.dart';
import 'user_metadata_entity.dart';

class User {
  
    final String id;
    final String aud;
    final String role;
    final String email;
    final DateTime emailConfirmedAt;
    final String phone;
    final DateTime confirmedAt;
    final DateTime lastSignInAt;
    final AppMetadata appMetadata;
    final UserMetadata userMetadata;
    final List<Identity> identities;
    final DateTime createdAt;
    final DateTime updatedAt;
    final bool isAnonymous;

    User({
        required this.id,
        required this.aud,
        required this.role,
        required this.email,
        required this.emailConfirmedAt,
        required this.phone,
        required this.confirmedAt,
        required this.lastSignInAt,
        required this.appMetadata,
        required this.userMetadata,
        required this.identities,
        required this.createdAt,
        required this.updatedAt,
        required this.isAnonymous,
    });

}