import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs/domain/domain.dart';
import 'package:bitacoras/features/logs/infrastructure/infrastructure.dart';

class ConceptsRepositoryImpl implements ConceptsRepository {

  final ConceptDatasource datasource;

  ConceptsRepositoryImpl({
    ConceptDatasource? datasource,
  }): datasource = datasource ?? ConceptsDatasourceImpl();

  @override
  Future<(ErrorMessage?, ConceptsEntity)> getConcepts() async {
    final ( errorMsg, conceptDto) = await datasource.getConcepts();
    return ( errorMsg, ConceptsMapper.dtoToEntity( conceptDto ) );
  }
  
}