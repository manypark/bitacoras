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

}
