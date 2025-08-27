import 'package:bitacoras/features/logs_form/infrastructure/enums/enums.dart';

class LogsRequestDto {

    final String idLog;
    final String description;
    final String imageUrl;
    final double latitud;
    final double longitud;
    final int idUser;
    final int idTasks;
    final int idConcept;
    final String conceptText;
    final String taskTitle;
    final DateTime dateCapturated;
    final LogStatusEnum status;

    LogsRequestDto({
      this.status = LogStatusEnum.capturated,
      required this.description,
      required this.imageUrl,
      required this.latitud,
      required this.longitud,
      required this.idUser,
      required this.idTasks,
      required this.idConcept,
      required this.conceptText,
      required this.taskTitle,
      required this.dateCapturated,
      required this.idLog,
    });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idTasks'     : idTasks,
      'idUser'      : idUser,
      'latitud'     : latitud,
      'longitud'    : longitud,
      'image_url'   : imageUrl,
      'idConcept'   : idConcept,
      'description' : description,
    };
  }

  factory LogsRequestDto.fromMap(Map<String, dynamic> map) => LogsRequestDto(
    description   : map['description'] ?? '',
    imageUrl      : map['imageUrl'] ?? '',
    latitud       : map['latitud']?.toDouble() ?? 0.0,
    longitud      : map['longitud']?.toDouble() ?? 0.0,
    idUser        : map['idUser']?.toInt() ?? 0,
    idTasks       : map['idTasks']?.toInt() ?? 0,
    idConcept     : map['idConcept']?.toInt() ?? 0,
    conceptText   : map['conceptText'] ?? '',
    taskTitle     : map['taskTitle'] ?? '',
    idLog         : map['idLog'] ?? '',
    status        : LogStatusEnum.values.firstWhere(
      (e) => e.name == map['status'],
      orElse: () => LogStatusEnum.capturated,
    ),
    dateCapturated: DateTime.parse( map['dateCapturated'] ),
  );  

  LogsRequestDto copyWith({
    String? idLog,
    String? description,
    String? imageUrl,
    double? latitud,
    double? longitud,
    int? idUser,
    int? idTasks,
    int? idConcept,
    String? conceptText,
    String? taskTitle,
    DateTime? dateCapturated,
    LogStatusEnum? status,
  }) {
    return LogsRequestDto(
      idLog: idLog ?? this.idLog,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      latitud: latitud ?? this.latitud,
      longitud: longitud ?? this.longitud,
      idUser: idUser ?? this.idUser,
      idTasks: idTasks ?? this.idTasks,
      idConcept: idConcept ?? this.idConcept,
      conceptText: conceptText ?? this.conceptText,
      taskTitle: taskTitle ?? this.taskTitle,
      dateCapturated: dateCapturated ?? this.dateCapturated,
      status: status ?? this.status,
    );
  }
}
