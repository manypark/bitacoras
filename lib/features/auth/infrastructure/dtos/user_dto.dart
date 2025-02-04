import 'identity_dto.dart';
import 'app_metadata_dto.dart';
import 'user_metadata_dto.dart';

class UserDto {
  
    final String id;
    final String aud;
    final String role;
    final String email;
    final DateTime emailConfirmedAt;
    final String phone;
    final DateTime confirmedAt;
    final DateTime lastSignInAt;
    final AppMetadataDto appMetadata;
    final UserMetadatasDto userMetadata;
    final List<Identity> identities;
    final DateTime createdAt;
    final DateTime updatedAt;
    final bool isAnonymous;

    UserDto({
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

  factory UserDto.fromMap(Map<String, dynamic> map) {
    
    return UserDto(
      id: map['id'] as String,
      aud: map['aud'] as String,
      role: map['role'] as String,
      email: map['email'] as String,
      emailConfirmedAt: DateTime.parse(map['email_confirmed_at']),
      phone: map['phone'] as String,
      confirmedAt: DateTime.parse(map['confirmed_at']),
      lastSignInAt: DateTime.parse(map['last_sign_in_at']),
      appMetadata: AppMetadataDto.fromMap(map['app_metadata'] as Map<String,dynamic>),
      userMetadata: UserMetadatasDto.fromMap(map['user_metadata'] as Map<String,dynamic>),
      identities: List<Identity>.from((map['identities']).map<Identity>((x) => Identity.fromMap(x as Map<String,dynamic>),),),
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      isAnonymous: map['is_anonymous'] as bool,
    );
  }

}
