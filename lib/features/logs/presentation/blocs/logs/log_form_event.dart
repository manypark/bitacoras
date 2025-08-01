part of 'log_form_bloc.dart';

sealed class TaksLogFormEvent extends Equatable {
  const TaksLogFormEvent();
  @override
  List<Object> get props => [];
}

class SelectOptionTaskLog extends TaksLogFormEvent {
  
  final String optionTaskLog;

  const SelectOptionTaskLog({
    required this.optionTaskLog,
  });

  @override
  List<Object> get props => [ optionTaskLog ];
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
