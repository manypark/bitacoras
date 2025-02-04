
class IdentityDataDto {
  
  final String email;
  final bool emailVerified;
  final bool phoneVerified;
  final String sub;

  IdentityDataDto({
      required this.email,
      required this.emailVerified,
      required this.phoneVerified,
      required this.sub,
    });

  factory IdentityDataDto.fromMap(Map<String, dynamic> map) {
    return IdentityDataDto(
      email: map['email'] as String,
      emailVerified: map['emailVerified'] as bool,
      phoneVerified: map['phoneVerified'] as bool,
      sub: map['sub'] as String,
    );
  }
}
