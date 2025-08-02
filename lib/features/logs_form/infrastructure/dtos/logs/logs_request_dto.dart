class LogsRequestDto {

    final String description;
    final String imageUrl;
    final double latitud;
    final double longitud;
    final int idUser;
    final int idTasks;
    final int idConcept;

    LogsRequestDto({
      required this.description,
      required this.imageUrl,
      required this.latitud,
      required this.longitud,
      required this.idUser,
      required this.idTasks,
      required this.idConcept,
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
}
