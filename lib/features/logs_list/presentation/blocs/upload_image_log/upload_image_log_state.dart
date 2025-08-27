part of 'upload_image_log_bloc.dart';

class UploadImageLogState extends Equatable {

  final LogsRequestDto? log;
  
  const UploadImageLogState({ 
    this.log,
  });

  @override
  List<Object?> get props => [log];

  UploadImageLogState copyWith({
    LogsRequestDto? log,
    bool? isLoading,
  }) => UploadImageLogState(
    log : log ?? this.log,
  );
}

final class UploadImageLogInitial extends UploadImageLogState {}