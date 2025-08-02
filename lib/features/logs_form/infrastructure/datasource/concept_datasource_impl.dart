import 'package:bitacoras/core/services/services.dart';
import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs_form/domain/domain.dart';
import 'package:bitacoras/features/logs_form/infrastructure/dtos/dtos.dart';

class ConceptsDatasourceImpl implements ConceptDatasource {

   HttpClientService httpClient;
  
  ConceptsDatasourceImpl({
    HttpClientServiceImpl? httpClient,
  }): httpClient = httpClient ?? HttpClientServiceImpl();

  @override
  Future<(ErrorMessage?, ConceptDto)> getConcepts() async {
    try {
      final response = await httpClient.get( path: '/concepts' );
      
      return (null, ConceptDto.fromMap(response) );
    } catch (e) {
      return (
        ErrorMessage( code: '500', error_code: e.toString(), msg: e.toString() ),
        ConceptDto(
          message : 'Error no controlado',
          status  : false,
          data    : [ConceptResponseDto(idConcept: 0, description: '', active: false)],
        )
      );
    }
  }
  
}