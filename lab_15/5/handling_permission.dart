import 'utils/import_export.dart';

class HandlingPermissionPage extends StatefulWidget {
  @override
  _HandlingPermissionPageState createState() => _HandlingPermissionPageState();
}

class _HandlingPermissionPageState extends State<HandlingPermissionPage> {
  String _status = 'Permission not requested yet.';

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      setState(() {
        _status = 'Camera permission already granted.';
      });
    } else {
      _requestCameraPermission();
    }
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();

    setState(() {
      if (status.isGranted) {
        _status = 'Camera permission granted.';
      } else if (status.isDenied) {
        _status = 'Camera permission denied. You can ask again.';
      } else if (status.isPermanentlyDenied) {
        _status = 'Camera permission permanently denied. Open settings to allow.';
        _showSettingsDialog();
      } else {
        _status = 'Permission status: $status';
      }
    });
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
            'Camera permission is permanently denied. Open app settings to allow it manually.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(ctx);
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Handle Denied Permissions')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: _checkCameraPermission,
                child: const Text('Request Camera Permission'),
              ),
              const SizedBox(height: 20),
              Text(_status, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
