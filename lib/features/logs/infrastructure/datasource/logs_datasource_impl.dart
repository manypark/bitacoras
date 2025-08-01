import 'package:bitacoras/core/services/services.dart';
import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs/domain/domain.dart';
import 'package:bitacoras/features/logs/infrastructure/infrastructure.dart';

class LogsDatasourceImpl implements LogsDatasource {

  HttpClientService httpClient;
  
  LogsDatasourceImpl({
    HttpClientServiceImpl? httpClient,
  }): httpClient = httpClient ?? HttpClientServiceImpl();

  @override
  Future<(ErrorMessage?, LogsDto)> postTaskLog( LogsRequestDto dataForm) async {
    try {

      final response = await httpClient.post(
        path: '/logs',
        data: dataForm.toMap()
      );
      
      return (null, LogsDto.fromMap(response) );

    } catch (e) {
      
      return (
        ErrorMessage(code: '500', error_code: e.toString(), msg: e.toString()), 
        LogsDto(
          message : '',
          status  : false,
          data    : LogsResponseDto(
            description: '',
            imageUrl: '',
            latitud: 0.0,
            longitud: 0.0, 
            idUser: 0, 
            idTasks: 0, 
            idConcept: 0, 
            uploaded: false,
          )
        )
      );
    }
  }

}
