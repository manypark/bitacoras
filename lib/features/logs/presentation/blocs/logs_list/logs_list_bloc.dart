import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/logs/infrastructure/dtos/logs/logs.dart';

part 'logs_list_event.dart';
part 'logs_list_state.dart';

class LogsListBloc extends Bloc<LogsListEvent, LogsListState> {

  LogsListBloc() : super(LogsListInitial()) {
    on<LogsListEvent>((event, emit) {});
    on<AddLogsToList>( _onAddLogToList );
  }

  void addLogToList( LogsRequestDto logsList ) {
    add( AddLogsToList( logsList: [logsList] ) );
  }

// ==============================
// Hanlders Functions
// ==============================
  void _onAddLogToList( AddLogsToList event, Emitter<LogsListState> emit ) {
    emit( state.copyWith( logsList: [ ...state.logsList, ...event.logsList ] ) );
  }

}
