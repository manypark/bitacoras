import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'range_dates_event.dart';
part 'range_dates_state.dart';

class RangeDatesBloc extends Bloc<RangeDatesEvent, RangeDatesState> {

  RangeDatesBloc() : super(RangeDatesState(
    startDate : DateTime.now(),
    endDate   : DateTime.now(),
  )) {
    on<UpdateStartDateAndEndDate>( _updateStartAdnEndDate );
  }

  onUpdateStartAdnEndDate( DateTime startDate, DateTime endDate ) {
    add( UpdateStartDateAndEndDate(startDate: startDate, endDate: endDate) );
  }

  void _updateStartAdnEndDate( UpdateStartDateAndEndDate event, Emitter<RangeDatesState> emit ) {
    emit( state.copyWith( startDate: event.startDate, endDate: event.endDate ) );
  }

}
