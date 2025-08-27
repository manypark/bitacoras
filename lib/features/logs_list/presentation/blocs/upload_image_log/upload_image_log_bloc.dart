import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/auth/domain/domain.dart';
import 'package:bitacoras/features/logs_form/infrastructure/infrastructure.dart';
import 'package:bitacoras/features/logs_list/infrastructure/infrastructure.dart';
import 'package:bitacoras/features/logs_list/domain/usecase/upload_image_usecase.dart';

part 'upload_image_log_event.dart';
part 'upload_image_log_state.dart';

class UploadImageLogBloc extends Bloc<UploadImageLogEvent, UploadImageLogState> {

  UploadImageLogBloc() : super( UploadImageLogInitial() ) {
    on<UploadImageLogEvent>( _updateStatusLog );
    on<IsLoadingLogEvent>( _updateIsLoading );
  }

  Future<LogsRequestDto> uploadLogWithImageFromCludinary( LogsRequestDto log, UserEntity user ) async {

    add( IsLoadingLogEvent( isLoading:true ) );

    final uploadImageUsecase = UploadImageLogUsecase(
      repository: UploadImageLogRepositoryImpl(
        datasource: UploadImageLogDatasourceImpl()
      )
    );

    final (errMsg, newUrlImage) = await uploadImageUsecase(log.imageUrl, '${user.firstName}-${user.lastName}');

    final newLogUploadet = log.copyWith(
      imageUrl: newUrlImage,
      status  : LogStatusEnum.uploaded
    );

    add( UploadImageLogEvent( log:newLogUploadet ) );
    add( IsLoadingLogEvent( isLoading:false ) );

    return newLogUploadet;
  }

  // ==============================
  // Hanlders Functions
  // ==============================
  void _updateStatusLog(  UploadImageLogEvent event, Emitter<UploadImageLogState> emit ) => emit( state.copyWith( log: event.log ) );
  void _updateIsLoading(  IsLoadingLogEvent event, Emitter<UploadImageLogState> emit ) => emit( state.copyWith( isLoading: event.isLoading ) );
}