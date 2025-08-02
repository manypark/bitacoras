import 'package:bitacoras/shared/entities/entities.dart';

class LogEntity extends GeneralEntity<LogResponseEntity> {
  LogEntity({
    required super.status, 
    required super.message, 
    required super.data,
  });
}

class LogResponseEntity {

    final String description;
    final String imageUrl;
    final double latitud;
    final double longitud;
    final int idUser;
    final int idTasks;
    final int idConcept;
    final bool uploaded;

  LogResponseEntity({
    this.uploaded = false,
    required this.description,
    required this.imageUrl,
    required this.latitud,
    required this.longitud,
    required this.idUser,
    required this.idTasks,
    required this.idConcept,
  });
  
}