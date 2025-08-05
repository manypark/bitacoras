part of 'log_form_bloc.dart';

class TaksLogFormState extends Equatable {

  final int idOptionConcept;
  final String description;
  final String pathImage;
  final String nameTask;
  final int idTask;
  final double latitud;
  final double longitud;
  final String conceptText;

  const TaksLogFormState({
    this.idOptionConcept = 0,
    this.description = '',
    this.pathImage = '',
    this.nameTask = '',
    this.idTask = 0,
    this.latitud = 0.0,
    this.longitud = 0.0,
    this.conceptText = '',
  });

  TaksLogFormState copyWith({
    int? idOptionConcept,
    String? description,
    String? pathImage,
    double? latitud,
    double? longitud,
    String? nameTask,
    int? idTask,
    String? conceptText,
  }) => TaksLogFormState(
    idOptionConcept: idOptionConcept ?? this.idOptionConcept,
    description         : description ?? this.description,
    pathImage           : pathImage ?? this.pathImage,
    idTask              : idTask ?? this.idTask,
    latitud             : latitud ?? this.latitud,
    longitud            : longitud ?? this.longitud,
    nameTask            : nameTask ?? this.nameTask,
    conceptText            : conceptText ?? this.conceptText,
  );

  @override
  List<Object> get props => [idOptionConcept, description, pathImage, idTask, latitud, longitud, nameTask, conceptText];

}

final class TaksLogFormInitial extends TaksLogFormState {}
