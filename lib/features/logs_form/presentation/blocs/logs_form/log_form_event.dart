part of 'log_form_bloc.dart';

sealed class TaksLogFormEvent extends Equatable {
  const TaksLogFormEvent();
  @override
  List<Object> get props => [];
}

class SelectOptionTaskLog extends TaksLogFormEvent {
  
  final int optionTaskLog;
  final String conceptText;

  const SelectOptionTaskLog({
    required this.optionTaskLog,
    required this.conceptText,
  });

  @override
  List<Object> get props => [ optionTaskLog, conceptText ];
}

class SelectIdTask extends TaksLogFormEvent {
  
  final int idTask;

  const SelectIdTask({ required this.idTask });

  @override
  List<Object> get props => [ idTask ];
}

class SelectNameTask extends TaksLogFormEvent {
  
  final String nameTask;

  const SelectNameTask({ required this.nameTask });

  @override
  List<Object> get props => [ nameTask ];
}

class SelectImagePath extends TaksLogFormEvent {
  
  final String pathImage;

  const SelectImagePath({ required this.pathImage });

  @override
  List<Object> get props => [ pathImage ];
}

class WriteDescriptionLog extends TaksLogFormEvent {
  
  final String description;

  const WriteDescriptionLog({ required this.description });

  @override
  List<Object> get props => [ description ];
}

class GetCurrentLocation extends TaksLogFormEvent {

  final double latitud;
  final double longitud;

  const GetCurrentLocation({
    required this.latitud,
    required this.longitud,
  });

  @override
  List<Object> get props => [ latitud, longitud ];

}
