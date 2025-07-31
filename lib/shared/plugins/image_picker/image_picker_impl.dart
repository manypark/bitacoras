import 'package:image_picker/image_picker.dart';

import 'package:bitacoras/shared/plugins/image_picker/image_picker.dart';
import 'package:bitacoras/shared/plugins/permissions_handler/permissions_handler.dart';

class SelectImageImpl extends SelectImage {

  @override
  Future<String> getImageFromCamera() async {

    if( await PermissionsHandler.hasCameraPermission() ) {

      final ImagePicker picker = ImagePicker();

      final XFile? photo = await picker.pickImage( source : ImageSource.camera );

      return photo?.path ?? '';
    }

    return '';

  }
  
}