import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

import 'package:bitacoras/shared/utils/geolocation/geolocator_impl.dart';

part 'taks_log_form_event.dart';
part 'taks_log_form_state.dart';

class TaksLogFormBloc extends Bloc<TaksLogFormEvent, TaksLogFormState> {

  TaksLogFormBloc() : super( TaksLogFormInitial() ) {
    on<SelectOptionTaskLog>( _onSelectOptionTaskLog );
    on<SelectIdTask>( _onSelectIdTask );
    on<GetCurrentLocation>( _onSetCurrentLocation );
  }

  void selectOptionTaskLog( String valueOption ) {
    add( SelectOptionTaskLog(optionTaskLog: valueOption) );
  }

  void selectIdTask( int idTask ) {
    add( SelectIdTask(idTask: idTask) );
  }

  void setLCurrentLocation( double latitud, double longitud  ) {
    add( GetCurrentLocation(latitud: latitud, longitud: longitud) );
  }

  void _onSelectOptionTaskLog( SelectOptionTaskLog event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith(optionConceptTaskLog: event.optionTaskLog ) );
  }

  void _onSelectIdTask( SelectIdTask event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith(idTask: event.idTask ) );
  }

  void _onSetCurrentLocation( GetCurrentLocation event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith( latitud: event.latitud, longitud: event.longitud ) );
  }

  void submitTaksLog() async {
    final (lat, long) = await GetLocationImpl().getLocation();
    setLCurrentLocation(lat, long);
    state;
  }

}
