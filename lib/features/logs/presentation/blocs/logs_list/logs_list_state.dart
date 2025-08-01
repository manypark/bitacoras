part of 'logs_list_bloc.dart';

class LogsListState extends Equatable {

  final List<LogsRequestDto> logsList;

  const LogsListState({
    this.logsList = const []
  });

  @override
  List<Object> get props => [logsList];

  LogsListState copyWith({
    List<LogsRequestDto>? logsList,
  }) => LogsListState(
    logsList: logsList ?? this.logsList,
  );
}

final class LogsListInitial extends LogsListState {}
