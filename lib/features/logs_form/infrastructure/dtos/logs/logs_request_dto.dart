class LogsRequestDto {

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

    LogsRequestDto({
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

  factory LogsRequestDto.fromMap(Map<String, dynamic> map) {
    return LogsRequestDto(
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      latitud: map['latitud']?.toDouble() ?? 0.0,
      longitud: map['longitud']?.toDouble() ?? 0.0,
      idUser: map['idUser']?.toInt() ?? 0,
      idTasks: map['idTasks']?.toInt() ?? 0,
      idConcept: map['idConcept']?.toInt() ?? 0,
      conceptText: map['conceptText'] ?? '',
      taskTitle: map['taskTitle'] ?? '',
      dateCapturated: DateTime.parse( map['dateCapturated'] ),
    );
  }
  
}
