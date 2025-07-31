import 'utils/import_export.dart';

class MultiplePermissionPage extends StatefulWidget {
  @override
  _MultiplePermissionPageState createState() => _MultiplePermissionPageState();
}

class _MultiplePermissionPageState extends State<MultiplePermissionPage> {
  Map<Permission, PermissionStatus> _permissionStatuses = {
    Permission.camera: PermissionStatus.denied,
    Permission.location: PermissionStatus.denied,
    Permission.manageExternalStorage: PermissionStatus.denied,
  };

  Future<void> _requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      _permissionStatuses[permission] = status;
    });

    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  String _getStatusText(Permission permission) {
    final status = _permissionStatuses[permission];
    return '${permission.toString().split(".").last}: $status';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Individual Permission Requests')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => _requestPermission(Permission.camera),
                child: const Text('Request Camera Permission'),
              ),
              Text(_getStatusText(Permission.camera)),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () => _requestPermission(Permission.location),
                child: const Text('Request Location Permission'),
              ),
              Text(_getStatusText(Permission.location)),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () => _requestPermission(Permission.manageExternalStorage),
                child: const Text('Request Storage Permission'),
              ),
              Text(_getStatusText(Permission.manageExternalStorage)),
            ],
          ),
        ),
      ),
    );
  }
}
