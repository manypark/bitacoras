part of 'range_dates_bloc.dart';

class RangeDatesState extends Equatable {

  final DateTime startDate;
  final DateTime endDate;

  const RangeDatesState({
    required this.startDate,
    required this.endDate,
  });
  
  @override
  List<Object> get props => [startDate, endDate];

  RangeDatesState copyWith({
    DateTime? startDate,
    DateTime? endDate,
  }) => RangeDatesState(
    startDate : startDate ?? this.startDate,
    endDate   : endDate ?? this.endDate,
  );

  static Map<String, dynamic> toMap( RangeDatesState state ) {
    return {
      'startDate' : state.startDate.toIso8601String(),
      'endDate'   : state.endDate.toIso8601String(),
    };
  }

  factory RangeDatesState.fromMap( Map<String, dynamic> map ) {
    return RangeDatesState(
      startDate : DateTime.parse( map['startDate'] ),
      endDate   : DateTime.parse( map['endDate'] ),
    );
  }

}