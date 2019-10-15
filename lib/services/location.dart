import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    print('Fetching user current position...');
    try {
      var position = await Geolocator().getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  @override
  String toString() {
    return '$latitude;$longitude';
  }
}
