part of 'logs_list_bloc.dart';

class LogsListEvent extends Equatable {
  const LogsListEvent();
  @override
  List<Object> get props => [];
}

class AddLogsToList extends LogsListEvent {
  final List<LogsRequestDto> logsList;
  const AddLogsToList({this.logsList = const [] }); 
  @override
  List<Object> get props => [logsList];
}

class UpdateLogToList extends LogsListEvent {
  final List<LogsRequestDto> logsList;
  const UpdateLogToList({this.logsList = const [] }); 
  @override
  List<Object> get props => [logsList];
}

class ResetLogList extends LogsListEvent {
  final List<LogsRequestDto> logsList;
  const ResetLogList({ this.logsList = const [] });
  @override
  List<Object> get props => [logsList];
}

class DeleteOneLogList extends LogsListEvent {
  final List<LogsRequestDto> logsList;
  const DeleteOneLogList({ this.logsList = const [] });
  @override
  List<Object> get props => [logsList];
}
