import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;

      print('Lat:' + latitude.toString() + ' Lon:' + longitude.toString());
    }
    catch (e) {
      print(e);
    }
  }
}
