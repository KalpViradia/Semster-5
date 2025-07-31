import 'utils/import_export.dart';

class LocationPermissionPage extends StatefulWidget {
  @override
  _LocationPermissionPageState createState() => _LocationPermissionPageState();
}

class _LocationPermissionPageState extends State<LocationPermissionPage> {
  String _locationMessage = 'Location not fetched yet.';

  Future<void> _getLocation() async {
    PermissionStatus permission = await Permission.location.request();

    if (permission.isGranted) {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _locationMessage = 'Location services are disabled.';
        });
        return;
      }

      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        setState(() {
          _locationMessage =
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
        });
      } catch (e) {
        setState(() {
          _locationMessage = 'Failed to get location: $e';
        });
      }
    } else if (permission.isPermanentlyDenied) {
      setState(() {
        _locationMessage =
        'Permission permanently denied. Open app settings to grant permission.';
      });
      openAppSettings();
    } else {
      setState(() {
        _locationMessage = 'Location permission denied.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Permission & Fetch')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_locationMessage, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getLocation,
                child: const Text('Get Current Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
