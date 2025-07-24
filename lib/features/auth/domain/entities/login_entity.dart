import 'user_entity.dart';
import 'package:bitacoras/shared/entities/entities.dart';

class LogInEntity extends GeneralEntity<UserEntity> {

    final UserEntity? userEntity;

    LogInEntity({
        this.userEntity, 
        required super.status, 
        required super.message, 
        required super.data,
    });

}