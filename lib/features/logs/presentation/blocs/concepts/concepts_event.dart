part of 'concepts_bloc.dart';

sealed class ConceptsEvent extends Equatable {
  const ConceptsEvent();
  @override
  List<Object> get props => [];
}

class LoadConceptsList extends ConceptsEvent {
  final ConceptsEntity conceptEntity;
  const LoadConceptsList({required this.conceptEntity});
  @override
  List<Object> get props => [ conceptEntity ];
}
