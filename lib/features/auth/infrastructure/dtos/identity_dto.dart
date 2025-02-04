import 'identity_data_dto.dart';

class Identity {
  
    final String identityId;
    final String id;
    final String userId;
    final IdentityDataDto identityData;
    final String provider;
    final DateTime lastSignInAt;
    final DateTime createdAt;
    final DateTime updatedAt;
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

  factory Identity.fromMap(Map<String, dynamic> map) {
    return Identity(
      identityId: map['identityId'] as String,
      id: map['id'] as String,
      userId: map['userId'] as String,
      identityData: IdentityDataDto.fromMap(map['identityData'] as Map<String,dynamic>),
      provider: map['provider'] as String,
      lastSignInAt: DateTime.fromMillisecondsSinceEpoch(map['lastSignInAt'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      email: map['email'] as String,
    );
  }
}
