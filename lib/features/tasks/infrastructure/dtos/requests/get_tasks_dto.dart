
class GetTasksRequestDto {

  final int idUserAssigned;
  final String initDate;
  final String endDate;
  
  GetTasksRequestDto({
    required this.idUserAssigned,
    required this.initDate,
    required this.endDate,
  });
  
}
