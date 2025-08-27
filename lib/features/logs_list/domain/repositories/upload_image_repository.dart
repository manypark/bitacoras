import 'package:bitacoras/core/utils/utils.dart';

abstract interface class UploadImageRepository {
  Future<(ErrorMessage?, String)> uploadImageLog(String imageFile, String username );
}