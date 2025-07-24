import 'user_entity.dart';
import 'package:bitacoras/shared/entities/entities.dart';

class LogInEntity extends GeneralEntity<UserEntity> {

    LogInEntity({
        required super.status, 
        required super.message, 
        required super.data,
    });

}