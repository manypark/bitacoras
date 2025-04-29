part of 'taks_log_form_bloc.dart';

class TaksLogFormState extends Equatable {

  final String optionConceptTaskLog;
  final String description;
  final String pathImage;
  final String idTask;
  final double latitud;
  final double longitud;

  const TaksLogFormState({
    this.optionConceptTaskLog = '',
    this.description = '',
    this.pathImage = '',
    this.idTask = '',
    this.latitud = 0.0,
    this.longitud = 0.0,
  });

  TaksLogFormState copyWith({
    String? optionConceptTaskLog,
    String? description,
    String? pathImage,
    String? idTask,
    double? latitud,
    double? longitud,
  }) => TaksLogFormState(
    optionConceptTaskLog: optionConceptTaskLog ?? this.optionConceptTaskLog,
    description         : description ?? this.description,
    pathImage           : pathImage ?? this.pathImage,
    idTask              : idTask ?? this.idTask,
    latitud             : latitud ?? this.latitud,
    longitud            : longitud ?? this.longitud,
  );

  @override
  List<Object> get props => [optionConceptTaskLog, description, pathImage, idTask, latitud, longitud];

}

final class TaksLogFormInitial extends TaksLogFormState {}
