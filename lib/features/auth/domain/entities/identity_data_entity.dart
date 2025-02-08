
class IdentityData {
  
    final String email;
    final bool emailVerified;
    final bool phoneVerified;
    final String sub;

    IdentityData({
        required this.email,
        required this.emailVerified,
        required this.phoneVerified,
        required this.sub,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'emailVerified': emailVerified,
      'phoneVerified': phoneVerified,
      'sub': sub,
    };
  }

  factory IdentityData.fromMap(Map<String, dynamic> map) {
    return IdentityData(
      email: map['email'] as String,
      emailVerified: map['emailVerified'] as bool,
      phoneVerified: map['phoneVerified'] as bool,
      sub: map['sub'] as String,
    );
  }

}
