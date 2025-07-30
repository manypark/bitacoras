
class TaskLogsRequestDto {

    final DataDto data;

    TaskLogsRequestDto({ required this.data });

    Map<String, dynamic> toMap() {
      return <String, dynamic>{
        '_data': data.toMap(),
      };
    }

}

class DataDto {

    final String taskId;
    final double latitud;
    final double longitud;
    final String imageUrl;
    final String concept;
    final String description;

    DataDto({
      required this.taskId,
      required this.latitud,
      required this.longitud,
      required this.imageUrl,
      required this.concept,
      required this.description,
    });

    Map<String, dynamic> toMap() {
      return <String, dynamic>{
        'task_id'     : taskId,
        'latitud'     : latitud,
        'longitud'    : longitud,
        'image_url'   : imageUrl,
        'concept'     : concept,
        'description' : description,
      };
    }

}