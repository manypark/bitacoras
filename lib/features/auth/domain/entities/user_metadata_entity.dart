
class UserMetadata {
  
    final bool emailVerified;

    UserMetadata({
        required this.emailVerified,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'emailVerified': emailVerified,
    };
  }

  factory UserMetadata.fromMap(Map<String, dynamic> map) {
    return UserMetadata(
      emailVerified: map['emailVerified'] as bool,
    );
  }
}
