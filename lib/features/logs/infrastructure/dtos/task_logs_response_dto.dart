
class TaskLogsResponseDto {

    final String taskLogId;
    final String message;

    TaskLogsResponseDto({
      required this.taskLogId,
      required this.message,
    });

  factory TaskLogsResponseDto.fromMap(Map<String, dynamic> map) {
    return TaskLogsResponseDto(
      taskLogId : map['task_log_id'],
      message   : map['message'],
    );
  }
}