part of 'upload_image_log_bloc.dart';

class UploadImageLogState extends Equatable {

  final LogsRequestDto? log;
  final bool isLoading;
  
  const UploadImageLogState({ 
    this.log,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [log,isLoading];

  UploadImageLogState copyWith({
    LogsRequestDto? log,
    bool? isLoading,
  }) => UploadImageLogState(
    log       : log ?? this.log,
    isLoading : isLoading ?? this.isLoading,
  );
}

final class UploadImageLogInitial extends UploadImageLogState {}