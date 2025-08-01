import 'package:bitacoras/shared/entities/general.entity.dart';

class ConceptsEntity extends GeneralEntity<List<ConceptsResponseEntity>> {
  const ConceptsEntity({
    required super.status, 
    required super.message, 
    required super.data,
  });
}

class ConceptsResponseEntity {
  
  final int idConcept;
  final String description;
  final bool active;

  ConceptsResponseEntity({
    required this.idConcept, 
    required this.description, 
    required this.active,
  });

  factory ConceptsResponseEntity.fromMap(Map<String, dynamic> map) {
    return ConceptsResponseEntity(
      idConcept: map['idConcept']?.toInt() ?? 0,
      description: map['description'] ?? '',
      active: map['active'] ?? false,
    );
  }

}
