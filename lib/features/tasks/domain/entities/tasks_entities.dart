class ListTasksEntity {

  final List<TasksEntity> listTasks;

  ListTasksEntity({
    required this.listTasks,
  });
  
}

class TasksEntity {
  
    final String taskId;
    final String companyId;
    final String title;
    final String description;
    final String status;

    TasksEntity({
        required this.taskId,
        required this.companyId,
        required this.title,
        required this.description,
        required this.status,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskId'      : taskId,
      'companyId'   : companyId,
      'title'       : title,
      'description' : description,
      'status'      : status,
    };
  }

  factory TasksEntity.fromMap(Map<String, dynamic> map) {
    return TasksEntity(
      taskId      : map['taskId'],
      companyId   : map['companyId'],
      title       : map['title'],
      description : map['description'],
      status      : map['status'],
    );
  }

}
