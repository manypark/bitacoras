import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/logs_form/domain/domain.dart';
import 'package:bitacoras/features/logs_form/infrastructure/infrastructure.dart';

part 'logs_list_event.dart';
part 'logs_list_state.dart';

class LogsListBloc extends Bloc<LogsListEvent, LogsListState> with HydratedMixin {

  LogsListBloc() : super(LogsListInitial()) {
    hydrate();
    on<LogsListEvent>((event, emit) {});
    on<AddLogsToList>( _onAddLogToList );
    on<UpdateLogToList>( _onUpdateLogToList );
    on<ResetLogList>( _onResetLogList );
    on<DeleteOneLogList>( _onDeleteLogList );
  }

  void addLogToList( LogsRequestDto logsList ) {
    add( AddLogsToList( logsList: [logsList] ) );
  }

  void updateLogToList( LogsRequestDto logUpdated ) {

    final newLogList = state.logsList.map((log) {
      if( log.idLog == logUpdated.idLog ) return log = logUpdated;
      return log;
    }).toList();

    add( UpdateLogToList( logsList:newLogList ) );
  }

  Future<ErrorMessage?> uploadTaskLog( LogsRequestDto logImageUploaded ) async {

    final logUseCase = TaskLogUsecase( repository: LogsRepositoryImpl() );

    final (err, logEntity) = await logUseCase( logImageUploaded );

    final newlogImageUploaded = logImageUploaded.copyWith( status:LogStatusEnum.uploaded );

    if(err != null) return err;

    if(err == null) updateLogToList( newlogImageUploaded );

    return null;
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

  void _onUpdateLogToList( UpdateLogToList event, Emitter<LogsListState> emit ) {
    emit( state.copyWith( logsList: event.logsList ) );
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