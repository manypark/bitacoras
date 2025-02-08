import 'app_metadata_entity.dart';
import 'user_metadata_entity.dart';

class User {
  
    final String id;
    final String aud;
    final String role;
    final String email;
    final String emailConfirmedAt;
    final String phone;
    final String confirmedAt;
    final String lastSignInAt;
    final AppMetadata appMetadata;
    final UserMetadata userMetadata;
    final String createdAt;
    final String updatedAt;
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
        required this.createdAt,
        required this.updatedAt,
        required this.isAnonymous,
    });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      aud: map['aud'] as String,
      role: map['role'] as String,
      email: map['email'] as String,
      emailConfirmedAt: map['emailConfirmedAt'] as String,
      phone: map['phone'] as String,
      confirmedAt: map['confirmedAt'] as String,
      lastSignInAt: map['lastSignInAt'] as String,
      appMetadata: AppMetadata.fromMap(map['appMetadata'] as Map<String,dynamic>),
      userMetadata: UserMetadata.fromMap(map['userMetadata'] as Map<String,dynamic>),
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      isAnonymous: map['isAnonymous'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'aud': aud,
      'role': role,
      'email': email,
      'emailConfirmedAt': emailConfirmedAt,
      'phone': phone,
      'confirmedAt': confirmedAt,
      'lastSignInAt': lastSignInAt,
      'appMetadata': appMetadata.toMap(),
      'userMetadata': userMetadata.toMap(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isAnonymous': isAnonymous,
    };
  }
}
