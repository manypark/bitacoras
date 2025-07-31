import 'package:permission_handler/permission_handler.dart';

class PermissionsHandler {

  // ==============================================
  // Permiso de camara
  // ==============================================
  static Future<bool> hasCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) return true;

    final result = await Permission.camera.request();
    return result.isGranted;
  }

  // ==============================================
  // Permiso para la geolocalizacion
  // ==============================================
  static Future<bool> hasCurrentLocationPermission() async {
    
    final status = await Permission.locationWhenInUse.request();

    if( status.isPermanentlyDenied ) {
      await openAppSettings(); // Opcional: abre configuración
    }

    return status.isGranted;
  }

  
  
}