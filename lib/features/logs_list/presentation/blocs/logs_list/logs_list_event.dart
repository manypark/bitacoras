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