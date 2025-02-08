import 'identity_dto.dart';
import 'app_metadata_dto.dart';
import 'user_metadata_dto.dart';

class UserDto {
  
    final String id;
    final String aud;
    final String role;
    final String email;
    final String emailConfirmedAt;
    final String phone;
    final String confirmedAt;
    final String lastSignInAt;
    final AppMetadataDto appMetadata;
    final UserMetadatasDto userMetadata;
    final List<Identity> identities;
    final String createdAt;
    final String updatedAt;
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
      emailConfirmedAt: map['email_confirmed_at'] as String,
      phone: map['phone'] as String,
      confirmedAt: map['confirmed_at'] as String,
      lastSignInAt: map['last_sign_in_at'] as String,
      appMetadata: AppMetadataDto.fromMap(map['app_metadata'] as Map<String,dynamic>),
      userMetadata: UserMetadatasDto.fromMap(map['user_metadata'] as Map<String,dynamic>),
      identities: List<Identity>.from((map['identities']).map<Identity>((x) => Identity.fromMap(x as Map<String,dynamic>),),),
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      isAnonymous: map['is_anonymous'] as bool,
    );
  }

}
