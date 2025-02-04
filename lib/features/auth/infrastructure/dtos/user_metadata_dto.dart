
class UserMetadatasDto {
  
  final bool emailVerified;

  UserMetadatasDto({
      required this.emailVerified,
  });

  factory UserMetadatasDto.fromMap(Map<String, dynamic> map) {
    return UserMetadatasDto(
      emailVerified: map['email_verified'] as bool,
    );
  }

}
