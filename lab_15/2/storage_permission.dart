import 'utils/import_export.dart';

class StoragePermissionPage extends StatefulWidget {
  @override
  _StoragePermissionPageState createState() => _StoragePermissionPageState();
}

class _StoragePermissionPageState extends State<StoragePermissionPage> {
  String _status = 'Permission not requested yet.';

  Future<void> _requestStoragePermission() async {
    PermissionStatus status;

    if (await Permission.manageExternalStorage.isGranted) {
      status = PermissionStatus.granted;
    } else {
      status = await Permission.manageExternalStorage.request();
    }

    setState(() {
      if (status.isGranted) {
        _status = 'Storage permission granted.';
      } else if (status.isDenied) {
        _status = 'Storage permission denied.';
      } else if (status.isPermanentlyDenied) {
        _status = 'Permission permanently denied. Open settings to allow.';
        openAppSettings();
      } else {
        _status = 'Permission status: $status';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Storage Permission')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_status, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _requestStoragePermission,
                child: const Text('Request Storage Permission'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}