import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:bitacoras/features/logs_form/domain/domain.dart';

part 'concepts_event.dart';
part 'concepts_state.dart';

class ConceptsBloc extends Bloc<ConceptsEvent, ConceptsState> with HydratedMixin {

  final _conceptList = ConcetpUsecase();

  ConceptsBloc() : super(ConceptsInitial()) {
    hydrate();
    on<LoadConceptsList>( _onLoadConceptList );
  }

  Future<ConceptsEntity> loadConceptList() async {

    final ( err, conceptEntity ) = await _conceptList();

    if( err != null ) {
      return ConceptsEntity(status: false, message: err.msg, data: []);
    }

    add( LoadConceptsList( conceptEntity: conceptEntity ));

    return conceptEntity;
  }

  // ==============================
  // Hanlders Functions
  // ==============================
  void _onLoadConceptList( LoadConceptsList event, Emitter<ConceptsState> emit ) {
    emit( state.copyWith( concepts: event.conceptEntity) );
  }

// ==============================
// Hydratation functions
// ==============================
  @override
  ConceptsState? fromJson(Map<String, dynamic> json) {
    return ConceptsState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(ConceptsState state) {
    return ConceptsState.toMap(state);
  }

}
