import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/logs_list/domain/repositories/repositories.dart';

class UploadImageLogUsecase {
  final UploadImageRepository repository;
  UploadImageLogUsecase({ required this.repository });
  Future<(ErrorMessage?, String)> call( String imageFile, String username ) => repository.uploadImageLog(imageFile, username); 
}