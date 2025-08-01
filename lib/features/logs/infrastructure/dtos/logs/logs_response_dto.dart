import 'package:bitacoras/shared/dto/dtos.dart';

class LogsDto extends GeneralDtoResponse<LogsResponseDto> {
  LogsDto({
    required super.status, 
    required super.message, 
    required super.data,
  });

  factory LogsDto.fromMap( Map<String, dynamic> map ) {
    return LogsDto(
      status  : map['status'], 
      message : map['message'], 
      data    : map['data'] != null ? LogsResponseDto.fromMap( map['data'] ) : null,
    );
  }
}
class LogsResponseDto {

    final String description;
    final String imageUrl;
    final double latitud;
    final double longitud;
    final int idUser;
    final int idTasks;
    final int idConcept;
    final bool uploaded;

  LogsResponseDto({
    required this.description,
    required this.imageUrl,
    required this.latitud,
    required this.longitud,
    required this.idUser,
    required this.idTasks,
    required this.idConcept,
    required this.uploaded,
  });

  factory LogsResponseDto.fromMap(Map<String, dynamic> map) => LogsResponseDto(
    description : map['description'] ?? '',
    imageUrl    : map['imageUrl'] ?? '',
    latitud     : map['latitud']?.toDouble() ?? 0.0,
    longitud    : map['longitud']?.toDouble() ?? 0.0,
    idUser      : map['idUser']?.toInt() ?? 0,
    idTasks     : map['idTasks']?.toInt() ?? 0,
    idConcept   : map['idConcept']?.toInt() ?? 0,
    uploaded    : map['uploaded'] ?? false,
  );

}
