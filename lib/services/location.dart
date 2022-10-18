import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;
  Future<void> getoCurrentLocation() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      print(e);
      position = (await Geolocator.getLastKnownPosition())!;
    }
    longitude = position.longitude;
    latitude = position.latitude;
  }
}
