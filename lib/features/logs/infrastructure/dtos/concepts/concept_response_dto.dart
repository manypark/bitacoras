import 'package:bitacoras/shared/dto/dtos.dart';

class ConceptDto extends GeneralDtoResponse<List<ConceptResponseDto>> {
  ConceptDto({
    required super.status, 
    required super.message, 
    required super.data,
  });
  factory ConceptDto.fromMap( Map<String, dynamic> map ) {
    return ConceptDto(
      status  : map['status'], 
      message : map['message'], 
      data    : map['data'] != null ? List<ConceptResponseDto>.from(map["data"].map((x) => ConceptResponseDto.fromMap(x))) : null,
    );
  }
}

class ConceptResponseDto {

  final int idConcept;
  final String description;
  final bool active;

  ConceptResponseDto({
    required this.idConcept, 
    required this.description, 
    required this.active,
  });

  factory ConceptResponseDto.fromMap( Map<String, dynamic> map ) => ConceptResponseDto(
    active      : map['active'] ?? false,
    idConcept   : map['idConcept']?.toInt() ?? 0,
    description : map['description'] ?? '',
  );
}
