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
      identityId: map['identity_id'] as String,
      id: map['id'] as String,
      userId: map['user_id'] as String,
      identityData: IdentityDataDto.fromMap(map['identity_data']),
      provider: map['provider'] as String,
      lastSignInAt: DateTime.parse(map['last_sign_in_at']),
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      email: map['email'] as String,
    );
  }
}
