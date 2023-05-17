import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRoad {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  const DirectionsRoad({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  ///Obtenemos las direcciones del JSON
  factory DirectionsRoad.fromMap(Map<String, dynamic> map) {
    ///No hay direcciones
   // if ((map['routes'] as List).isEmpty) return null;

    final data = Map<String, dynamic>.from(map['routes'][0]);
    
    final northeast = LatLng(data['bounds']['northeast']['lat'], data['bounds']['northeast']['lng']);
    final southwest = LatLng(data['bounds']['southwest']['lat'], data['bounds']['southwest']['lng']);
    final bounds = LatLngBounds(northeast: northeast, southwest: southwest);

    String distance = '';
    String duration = '';
    if((data['legs'] as List).isEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return DirectionsRoad(
      bounds: bounds, 
      polylinePoints: PolylinePoints().decodePolyline(data['overview_polyline']['points']), 
      totalDistance: distance, 
      totalDuration: duration
    );

  }
}