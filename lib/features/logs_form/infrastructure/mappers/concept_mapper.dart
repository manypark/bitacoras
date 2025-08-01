import 'package:bitacoras/features/logs_form/domain/domain.dart';
import 'package:bitacoras/features/logs_form/infrastructure/infrastructure.dart';

class ConceptsMapper {

  static ConceptsEntity dtoToEntity ( ConceptDto data ) => ConceptsEntity(
    status  : data.status, 
    message : data.message, 
    data    : data.data?.map( (concept) {
      return ConceptsResponseEntity(idConcept: concept.idConcept, description: concept.description, active: concept.active);
    },).toList() ?? [],
  );
  
}