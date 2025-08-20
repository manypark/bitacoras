part of 'logs_list_bloc.dart';

class LogsListState extends Equatable {

  final List<LogsRequestDto> logsList;

  const LogsListState({
    this.logsList = const []
  });

  LogsListState copyWith({
    List<LogsRequestDto>? logsList,
  }) => LogsListState(
    logsList: logsList ?? this.logsList,
  );

  @override
  List<Object> get props => [logsList];

  factory LogsListState.fromMap(Map<String, dynamic> map) {
    return LogsListState(
      logsList: List<LogsRequestDto>.from(map['logsList']?.map((x) => LogsRequestDto.fromMap(x))),
    );
  }

  static Map<String, dynamic> toMap( LogsListState state ) {
    return {
      "logsList" : state.logsList.map((e) => {
        "description"   : e.description,
        "imageUrl"      : e.imageUrl,
        "latitud"       : e.latitud,
        "longitud"      : e.longitud,
        "idUser"        : e.idUser,
        "idTasks"       : e.idTasks,
        "idConcept"     : e.idConcept,
        "conceptText"   : e.conceptText,
        "taskTitle"     : e.taskTitle,
        "dateCapturated": e.dateCapturated.toIso8601String(),
      }).toList(),
    };
  }
}

final class LogsListInitial extends LogsListState {}
