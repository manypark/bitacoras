import 'package:dio/dio.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/logs_list/domain/datasource/datasource.dart';

class UploadImageLogDatasourceImpl implements UploadImageDatasource {

  UploadImageLogDatasourceImpl();

  @override
  Future<(ErrorMessage?, String)> uploadImageLog(String imageFile, String username) async {

    final dio = Dio();
    String imageUrl = '';

    try {

      final formData = FormData.fromMap({
        'file'          : await MultipartFile.fromFile(imageFile),
        'upload_preset' : Environments.uploadPreset,
        'folder'        : username,
      });

      final response = await dio.post( Environments.uploadUrlCloudinary, data:formData );

      if (response.statusCode == 200) {
        imageUrl = response.data['secure_url'];
        return (null, imageUrl);
      }

      return (ErrorMessage( error_code:response.statusCode.toString(), msg:'Error no controlado'), '');
    } catch (e) {
      return ( ErrorMessage( error_code:'500', msg: e.toString()), '' );
    }
  }
  
}