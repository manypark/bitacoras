part of 'concepts_bloc.dart';

class ConceptsState extends Equatable {

  final ConceptsEntity concepts;

  const ConceptsState({
    this.concepts = const ConceptsEntity(status: false, message: '', data: []),
  });

  ConceptsState copyWith({
    ConceptsEntity? concepts,
  }) => ConceptsState(
    concepts: concepts ?? this.concepts,
  );

  @override
  List<Object> get props => [concepts];

  static Map<String, dynamic> toMap( ConceptsState state ) {

    final concepts = state.concepts.data?.map( (e) => e.toJson() ).toList() ?? [];

    return <String, dynamic>{
      'concepts' : {
        'status'  : state.concepts.status,
        'message' : state.concepts.message,
        'data'    : concepts
      }
    };
  }

  factory ConceptsState.fromMap(Map<String, dynamic> map)  {

    return ConceptsState(
      concepts: ConceptsEntity(
        status  : map['concepts']['status'],
        message : map['concepts']['message'],
        data    : List<ConceptsResponseEntity>.from( (map['concepts']['data'] as List<dynamic>).map((x) => ConceptsResponseEntity.fromMap(x) )),
      ),
    );
  }

}

final class ConceptsInitial extends ConceptsState {}
