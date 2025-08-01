import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:path_provider/path_provider.dart';

import 'package:bitacoras/shared/plugins/geolocation/geolocator_impl.dart';

part 'log_form_event.dart';
part 'log_form_state.dart';

class TaksLogFormBloc extends Bloc<TaksLogFormEvent, TaksLogFormState> {

  TaksLogFormBloc() : super( TaksLogFormInitial() ) {
    on<SelectIdTask>( _onSelectIdTask );
    on<SelectNameTask>( _onSelectNameTask );
    on<SelectImagePath>( _onSelectPathImage );
    on<GetCurrentLocation>( _onSetCurrentLocation );
    on<SelectOptionTaskLog>( _onSelectOptionTaskLog );
    on<WriteDescriptionLog>( _onWriteDescriptionLog );
  }

  void selectOptionTaskLog( int idValueOption ) {
    add( SelectOptionTaskLog( optionTaskLog : idValueOption ) );
  }

  void selectIdTask( int idTask ) {
    add( SelectIdTask(idTask: idTask) );
  }

  void selectNameTask( String nameTask ) {
    add( SelectNameTask( nameTask: nameTask ) );
  }

  Future setLCurrentLocation( double latitud, double longitud  ) async {
    add( GetCurrentLocation(latitud: latitud, longitud: longitud) );
  }

  void selectPathImage( String pathImage  ) async {

    String imageSavePermanently = '';

    if( pathImage != '' ) {
      imageSavePermanently = await saveImagePermanently( File(pathImage) );
    }

    add( SelectImagePath( pathImage: imageSavePermanently ) );
  }

  void writeDescriptionLog( String description  ) {
    add( WriteDescriptionLog( description: description ) );
  }

  Future<TaksLogFormState> submitTaksLog() async {
    final (lat, long) = await GetLocationImpl().getLocation();
    await setLCurrentLocation(lat, long);
    return state;
  }

  Future<String> saveImagePermanently( File image ) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = path.basename(image.path);
    final savedImage = await image.copy('${directory.path}/$name');
    return savedImage.path; // Esta es la ruta que sí puedes guardar de forma segura
  }

  void resetLogForm() {
    selectOptionTaskLog(0);
    selectIdTask(0);
    selectNameTask('');
    setLCurrentLocation(0.0, 0.0);
    selectPathImage('');
    writeDescriptionLog('');
  }

// ==============================
// Hanlders Functions
// ==============================
  void _onSelectOptionTaskLog( SelectOptionTaskLog event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith(idOptionConcept: event.optionTaskLog ) );
  }

  void _onSelectIdTask( SelectIdTask event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith(idTask: event.idTask ) );
  }

  void _onSetCurrentLocation( GetCurrentLocation event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith( latitud: event.latitud, longitud: event.longitud ) );
  }

  void _onSelectNameTask( SelectNameTask event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith( nameTask: event.nameTask ) );
  }

  void _onSelectPathImage( SelectImagePath event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith( pathImage: event.pathImage ) );
  }

  void _onWriteDescriptionLog( WriteDescriptionLog event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith( description: event.description ) );
  }

}
