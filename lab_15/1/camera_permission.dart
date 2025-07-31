import 'utils/import_export.dart';

class CameraPermissionPage extends StatefulWidget {
  @override
  _CameraPermissionPageState createState() => _CameraPermissionPageState();
}

class _CameraPermissionPageState extends State<CameraPermissionPage> {
  String _status = 'Permission not requested yet.';

  Future<void> _requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();

    setState(() {
      if (status.isGranted) {
        _status = 'Camera permission granted.';
      } else if (status.isDenied) {
        _status = 'Camera permission denied.';
      } else if (status.isPermanentlyDenied) {
        _status = 'Permission permanently denied. Please enable it from settings.';
        openAppSettings();
      } else {
        _status = 'Permission status: $status';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Permission')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_status, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _requestCameraPermission,
                child: const Text('Request Camera Permission'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}