import 'package:geolocator/geolocator.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';

Future<List<HouseModel>> findNearbyPlaces(
    {required List<HouseModel> allPlaces,
    required Position currentLocation}) async {
  List<HouseModel> nearbyPlaces = allPlaces.map((place) {
    double distance = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      double.parse(place.latitude),
      double.parse(place.longitude),
    );
    return place.copyWith(distance: distance);
  }).toList();
  nearbyPlaces.sort((a, b) => a.distance!.compareTo(b.distance!));
  return nearbyPlaces ;
}
