
import 'identity_data_entity.dart';

class Identity {
  
    final String identityId;
    final String id;
    final String userId;
    final IdentityData identityData;
    final String provider;
    final String lastSignInAt;
    final String createdAt;
    final String updatedAt;
    final String email;

    Identity({
        required this.identityId,
        required this.id,
        required this.userId,
        required this.identityData,
        required this.provider,
        required this.lastSignInAt,
        required this.createdAt,
        required this.updatedAt,
        required this.email,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identityId': identityId,
      'id': id,
      'userId': userId,
      'identityData': identityData.toMap(),
      'provider': provider,
      'lastSignInAt': lastSignInAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'email': email,
    };
  }

  factory Identity.fromMap(Map<String, dynamic> map) {
    return Identity(
      identityId: map['identityId'] as String,
      id: map['id'] as String,
      userId: map['userId'] as String,
      identityData: IdentityData.fromMap(map['identityData'] as Map<String,dynamic>),
      provider: map['provider'] as String,
      lastSignInAt: map['lastSignInAt'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      email: map['email'] as String,
    );
  }

}
