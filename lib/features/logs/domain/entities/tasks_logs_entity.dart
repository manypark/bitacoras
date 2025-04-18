
class TaskLogsEntity {

    final Data data;

    TaskLogsEntity({ required this.data });

}

class Data {

    final String taskId;
    final double latitud;
    final double longitud;
    final String imageUrl;
    final String concept;
    final String description;

    Data({
      required this.taskId,
      required this.latitud,
      required this.longitud,
      required this.imageUrl,
      required this.concept,
      required this.description,
    });

}
