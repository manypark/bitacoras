import 'package:bitacoras/features/tasks/domain/models/models.dart';
import 'package:bitacoras/features/tasks/infrastructure/infrastructure.dart';

class GetTasksRequestMapper {

  static GetTasksRequestDto modelToDto ( GetTasksModel data ) => GetTasksRequestDto(
    idUserAssigned: data.idUserAssigned,
    initDate      : data.initDate,
    endDate       : data.endDate,
  );
  
}