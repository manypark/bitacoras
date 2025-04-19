import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

part 'taks_log_form_event.dart';
part 'taks_log_form_state.dart';

class TaksLogFormBloc extends Bloc<TaksLogFormEvent, TaksLogFormState> {

  TaksLogFormBloc() : super( TaksLogFormInitial() ) {
    on<SelectOptionTaskLog>( _onSelectOptionTaskLog );
    on<SelectIdTask>( _onSelectIdTask );
  }

  void selectOptionTaskLog( String valueOption ) {
    add( SelectOptionTaskLog(optionTaskLog: valueOption) );
  }

  void selectIdTask( String idTask ) {
    add( SelectIdTask(idTask: idTask) );
  }

  void _onSelectOptionTaskLog( SelectOptionTaskLog event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith(optionConceptTaskLog: event.optionTaskLog ) );
  }

  void _onSelectIdTask( SelectIdTask event, Emitter<TaksLogFormState> emit ) {
    emit( state.copyWith(idTask: event.idTask ) );
  }

  void submitTaksLog() {
    state;
  }

}
