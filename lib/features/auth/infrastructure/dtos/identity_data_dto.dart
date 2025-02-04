
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
      email: map['email'],
      emailVerified: bool.parse( map['email_verified'].toString() ),
      phoneVerified: bool.parse( map['phone_verified'].toString() ),
      sub: map['sub'],
    );
  }
}
