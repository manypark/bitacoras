import 'package:bitacoras/features/logs_form/domain/domain.dart';
import 'package:bitacoras/features/logs_form/infrastructure/dtos/dtos.dart';

class LogMapper {
  
  static LogEntity dtoToEntity ( LogsDto data ) => LogEntity(
    status  : data.status,
    message : data.message, 
    data    : LogResponseEntity(
      description : data.data?.description ?? '', 
      imageUrl    : data.data?.imageUrl ?? '', 
      latitud     : data.data?.latitud ?? 0.0, 
      longitud    : data.data?.longitud ?? 0.0, 
      idUser      : data.data?.idUser ?? 0, 
      idTasks     : data.data?.idTasks ?? 0, 
      idConcept   : data.data?.idConcept ?? 0,
    )
  );
  
}