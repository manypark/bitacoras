class ListTasksDto {

  final List<TasksDto> listTasks;

  ListTasksDto({
    required this.listTasks,
  });

  factory ListTasksDto.fromList(List<dynamic> jsonList) => ListTasksDto(listTasks: jsonList.map((e) => TasksDto.fromMap(e)).toList());
}

class TasksDto {
  
    final String taskId;
    final String companyId;
    final String title;
    final String description;
    final String status;
    final String createdAt;

    TasksDto({
        required this.taskId,
        required this.companyId,
        required this.title,
        required this.description,
        required this.status,
        required this.createdAt,
    });

  factory TasksDto.fromMap(Map<String, dynamic> map) {
    return TasksDto(
      taskId      : map['task_id'],
      companyId   : map['company_id'],
      title       : map['title'],
      status      : map['status'],
      description : map['description'],
      createdAt   : map['created_at'],
    );
  }

}
