import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logs_list_event.dart';
part 'logs_list_state.dart';

class LogsListBloc extends Bloc<LogsListEvent, LogsListState> {
  LogsListBloc() : super(LogsListInitial()) {
    on<LogsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
