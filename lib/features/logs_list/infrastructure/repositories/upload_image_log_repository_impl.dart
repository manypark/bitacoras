import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs_list/domain/domain.dart';

class UploadImageLogRepositoryImpl implements  UploadImageRepository {

  final UploadImageDatasource datasource;

  UploadImageLogRepositoryImpl({ required this.datasource });

  @override
  Future<(ErrorMessage?, String)> uploadImageLog(String imageFile, String username) async {
    final (errMsg, imageUploaded) = await datasource.uploadImageLog(imageFile, username);
    return (errMsg, imageUploaded);
  }
}