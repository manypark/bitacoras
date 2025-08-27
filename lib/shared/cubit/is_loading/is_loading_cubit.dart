import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'is_loading_state.dart';

class IsLoadingCubit extends Cubit<IsLoadingState> {
  IsLoadingCubit() : super(IsLoadingState());

  void startLoading() => emit( const IsLoadingState( isLoading:true ) );

  void stopLoading() => emit(const IsLoadingState(isLoading:false ));
}