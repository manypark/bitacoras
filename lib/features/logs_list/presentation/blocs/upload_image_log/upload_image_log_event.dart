part of 'upload_image_log_bloc.dart';

class UploadImageLogEvent extends Equatable {
  final LogsRequestDto? log;
  const UploadImageLogEvent({ this.log });
  @override
  List<Object?> get props => [log];
}

class IsLoadingLogEvent extends UploadImageLogEvent {
  final bool isLoading;
  const IsLoadingLogEvent({ this.isLoading = false });
  @override
  List<Object?> get props => [isLoading];
}
