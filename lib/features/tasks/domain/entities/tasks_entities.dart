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
    final String createdAt;

    TasksEntity({
        required this.taskId,
        required this.companyId,
        required this.title,
        required this.description,
        required this.status,
        required this.createdAt,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskId'      : taskId,
      'companyId'   : companyId,
      'title'       : title,
      'description' : description,
      'status'      : status,
      'created_at'  : createdAt,
    };
  }

  factory TasksEntity.fromMap(Map<String, dynamic> map) {
    return TasksEntity(
      taskId      : map['taskId'],
      companyId   : map['companyId'],
      title       : map['title'],
      description : map['description'],
      status      : map['status'],
      createdAt   : map['created_at'],
    );
  }

}
