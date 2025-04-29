// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'taks_log_form_bloc.dart';

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
  
  final String idTask;

  const SelectIdTask({ required this.idTask });

  @override
  List<Object> get props => [ idTask ];
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
