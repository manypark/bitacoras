part of 'range_dates_bloc.dart';

class RangeDatesEvent extends Equatable {
  const RangeDatesEvent();
  @override
  List<Object> get props => [];
}

class UpdateStartDateAndEndDate extends RangeDatesEvent {

  final DateTime startDate;
  final DateTime endDate;

  const UpdateStartDateAndEndDate({
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object> get props => [startDate,endDate];
}
