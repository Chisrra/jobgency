import 'package:dio/dio.dart';
import 'package:frontend/google_directions/directions_road.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend/global/map_key.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<DirectionsRoad> getDirections({
    required LatLng origin,
    required LatLng destination,
    required String mode,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'mode': mode,
        'key': mapKey,
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return DirectionsRoad.fromMap(response.data);
    }
    throw("Algo no salio bien");
  }
}