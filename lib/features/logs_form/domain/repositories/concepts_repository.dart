import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs_form/domain/entities/entities.dart';

abstract interface class ConceptsRepository {
  Future<(ErrorMessage?, ConceptsEntity)> getConcepts();
}