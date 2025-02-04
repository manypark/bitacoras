import 'identity_data_entity.dart';

class Identity {
  
    final String identityId;
    final String id;
    final String userId;
    final IdentityData identityData;
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

}