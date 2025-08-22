import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:bitacoras/features/logs_form/infrastructure/dtos/logs/logs.dart';

part 'logs_list_event.dart';
part 'logs_list_state.dart';

class LogsListBloc extends Bloc<LogsListEvent, LogsListState> with HydratedMixin {

  LogsListBloc() : super(LogsListInitial()) {
    hydrate();
    on<LogsListEvent>((event, emit) {});
    on<AddLogsToList>( _onAddLogToList );
    on<ResetLogList>( _onResetLogList );
    on<DeleteOneLogList>( _onDeleteLogList );
  }

  void addLogToList( LogsRequestDto logsList ) {
    add( AddLogsToList( logsList: [logsList] ) );
  }

  void resetLogList() {
    add( ResetLogList( logsList: [] ) );
  }

  void deleteOneLogList( String idLog ) {
    final newLogList = state.logsList.where((log) => log.idLog != idLog ).toList();
    add( DeleteOneLogList( logsList: newLogList ) );
  }

// ==============================
// Hanlders Functions
// ==============================
  void _onAddLogToList( AddLogsToList event, Emitter<LogsListState> emit ) {
    emit( state.copyWith( logsList: [ ...state.logsList, ...event.logsList ] ) );
  }

  void _onResetLogList( ResetLogList event, Emitter<LogsListState> emit ) {
    emit( state.copyWith(logsList: event.logsList) );
  }

  void _onDeleteLogList( DeleteOneLogList event, Emitter<LogsListState> emit ) {
    emit( state.copyWith(logsList: [ ...event.logsList ]) );
  }
  
  @override
  LogsListState? fromJson(Map<String, dynamic> json) {
    return LogsListState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(LogsListState state) {
    return LogsListState.toMap(state);
  }

}
