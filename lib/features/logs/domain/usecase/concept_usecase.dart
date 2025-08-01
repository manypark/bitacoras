import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs/domain/domain.dart';
import 'package:bitacoras/features/logs/infrastructure/infrastructure.dart';

class ConcetpUsecase {

  final ConceptsRepository repository;

  ConcetpUsecase({
    ConceptsRepository? repository,
  }): repository = repository ?? ConceptsRepositoryImpl();

  Future<(ErrorMessage?, ConceptsEntity)> call() async {
    return await repository.getConcepts();
  }
  
}
