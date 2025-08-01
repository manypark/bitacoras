part of 'logs_list_bloc.dart';

sealed class LogsListState extends Equatable {
  const LogsListState();
  
  @override
  List<Object> get props => [];
}

final class LogsListInitial extends LogsListState {}
