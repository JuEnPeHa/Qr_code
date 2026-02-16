import 'package:permission_handler/permission_handler.dart';

class CameraPermissionService {
  Future<bool> requestCameraAccess() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }
}
