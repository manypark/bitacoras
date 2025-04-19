part of 'taks_log_form_bloc.dart';

class TaksLogFormState extends Equatable {

  final String optionConceptTaskLog;
  final String description;
  final String pathImage;
  final String idTask;

  const TaksLogFormState({
    this.optionConceptTaskLog = '',
    this.description = '',
    this.pathImage = '',
    this.idTask = '',
  });

  TaksLogFormState copyWith({
    String? optionConceptTaskLog,
    String? description,
    String? pathImage,
    String? idTask,
  }) => TaksLogFormState(
    optionConceptTaskLog: optionConceptTaskLog ?? this.optionConceptTaskLog,
    description         : description ?? this.description,
    pathImage           : pathImage ?? this.pathImage,
    idTask              : idTask ?? this.idTask,
  );

  @override
  List<Object> get props => [optionConceptTaskLog, description, pathImage, idTask];

}

final class TaksLogFormInitial extends TaksLogFormState {}
