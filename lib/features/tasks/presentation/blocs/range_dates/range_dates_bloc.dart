import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'range_dates_event.dart';
part 'range_dates_state.dart';

class RangeDatesBloc extends Bloc<RangeDatesEvent, RangeDatesState> with HydratedMixin {

  RangeDatesBloc() : super(
    RangeDatesState(
      startDate : DateTime.now(),
      endDate   : DateTime.now(),
    )
  ) {
    hydrate();
    on<UpdateStartDateAndEndDate>( _updateStartAdnEndDate );
  }

  onUpdateStartAdnEndDate( DateTime startDate, DateTime endDate ) {
    add( UpdateStartDateAndEndDate(startDate: startDate, endDate: endDate) );
  }

// ############################# Update dates handler #############################
  void _updateStartAdnEndDate( UpdateStartDateAndEndDate event, Emitter<RangeDatesState> emit ) {
    emit( state.copyWith( startDate: event.startDate, endDate: event.endDate ) );
  }
  
  @override
  RangeDatesState? fromJson(Map<String, dynamic> json) {
    return RangeDatesState.fromMap( json );
  }
  
  @override
  Map<String, dynamic>? toJson(RangeDatesState state) {
    return RangeDatesState.toMap( state );
  }

}
