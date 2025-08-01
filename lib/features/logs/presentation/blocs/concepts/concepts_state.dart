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
    return <String, dynamic>{
      'concepts':state.concepts,
    };
  }

  factory ConceptsState.fromMap(Map<String, dynamic> map) {
    return ConceptsState(
      concepts: ConceptsEntity(
        status  : map['status'],
        message : map['message'],
        data    : List<ConceptsResponseEntity>.from( (map['data'] as List<dynamic>).map((x) => ConceptsResponseEntity.fromMap(x) )),
      ),
    );
  }

}

final class ConceptsInitial extends ConceptsState {}
