import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/google_directions/directions_road.dart';
import 'package:frontend/screens/payment_method/payment_methods_review.dart';
import 'package:frontend/widgets/appbar/app_bar_return.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../google_directions/directions_repository.dart';
import 'don_mauricio_contrat.dart';

class DonMauricio extends StatefulWidget {
  DonMauricio({Key? key}) : super(key: key);

  @override
  State<DonMauricio> createState() => _DonMauricioState();
}

class _DonMauricioState extends State<DonMauricio> {
  final Completer<GoogleMapController> _controllerGoogleMap =
      Completer<GoogleMapController>();
  GoogleMapController? _newGoogleMapController;

  static const LatLng _donMauricoStand =
      LatLng(21.911366494494366, -102.31019526193256);
  static const LatLng _cliente = LatLng(21.913798, -102.316318);
  late DirectionsRoad _directionsRoad;
  final Set<Polyline> _polylines = {};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: _donMauricoStand,
    zoom: 15,
  );

  @override
  void dispose() {
    _newGoogleMapController?.dispose();
    super.dispose();
  }

  _getRoute() async {
    // Get directions
    final directions = await DirectionsRepository().getDirections(
      mode: 'walking',
      origin: _donMauricoStand,
      destination: _cliente,
    );

    setState(() {
      _directionsRoad = directions;

      // Creamos un Polyline y agregamos a _polylines Set
      _polylines.add(Polyline(
        polylineId: PolylineId('camino_vehiculo_polyline'),
        color: Colors.lightBlueAccent,
        width: 5,
        patterns: <PatternItem>[PatternItem.dash(10), PatternItem.gap(5)],
        points: _directionsRoad.polylinePoints
            .map((e) => LatLng(e.latitude, e.longitude))
            .toList(),
      ));
    });
  }

  _centerView() async {
    await _newGoogleMapController!.getVisibleRegion();

    var left = min(_donMauricoStand.latitude, _cliente.latitude);
    var right = max(_donMauricoStand.latitude, _cliente.latitude);
    var bottom = min(_donMauricoStand.longitude, _cliente.longitude);
    var top = max(_donMauricoStand.longitude, _cliente.longitude);

    var bounds = LatLngBounds(
      southwest: LatLng(left, bottom),
      northeast: LatLng(right, top),
    );

    var cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 100);
    _newGoogleMapController!.animateCamera(cameraUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarReturn(title: "Fontanería/Don Mauricio"),
      body: Stack(
        children: [
          GoogleMap(
            markers: {
              const Marker(
                  markerId: MarkerId("FontaneríaDM"),
                  position: LatLng(21.911366494494366, -102.31019526193256))
            },
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            buildingsEnabled: true,
            minMaxZoomPreference: MinMaxZoomPreference(10, 19),
            onMapCreated: (GoogleMapController controller) async {
              _controllerGoogleMap.complete(controller);
              _newGoogleMapController = controller;

              await _getRoute();
              await _centerView();
            },
            polylines: _polylines,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 120),
              child: Container(
                height: 350,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "INFORMACIÓN DEL SERVICIO",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/donmauricio.jpg"),
                              ),
                              title: Text("Fontanería Don Mauricio"),
                              subtitle: Text(
                                  "En fontanerías Don Mauricio, estamos comprometidos con realizar trabajos de calidad"),
                            ),
                            const Text("Calificación"),
                            Text(
                              "9.5/10",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            ListTile(
                              leading: Icon(
                                Icons.hourglass_bottom,
                                color: Colors.orange,
                              ),
                              title: Text("Tiempo de llegada aproximada"),
                              subtitle: Text(
                                "5 Minutos",
                                style: TextStyle(color: Colors.green),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ListTile(
                              leading: Icon(Icons.info_rounded),
                              title: Text("Más sobre fontanería Don Mauricio"),
                            ),
                            const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n \nInteger eu neque nec lorem tincidunt rhoncus scelerisque at metus. Pellentesque hendrerit commodo felis ut feugiat. Aenean tristique a purus et sollicitudin. In fringilla, sem ornare dignissim lacinia, risus mi consequat lorem, id pretium enim purus ut libero. Morbi porta dolor a mi viverra, a finibus turpis suscipit. Maecenas ut leo quis orci scelerisque sodales at et nibh. Maecenas volutpat, metus vitae auctor iaculis, massa tellus sagittis ex, in pulvinar orci mi eget dolor. Curabitur blandit eget est vel mattis. Maecenas porttitor erat faucibus, scelerisque lectus quis, molestie eros. Duis congue sem a cursus sodales. "),
                            const SizedBox(
                              height: 20,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 200,
                                    child: Image.asset(
                                        "assets/images/dmexample1.jpg",
                                        fit: BoxFit.cover),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: Image.asset(
                                        "assets/images/dmexample3.jpg",
                                        fit: BoxFit.cover),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: Image.asset(
                                        "assets/images/dmexample2.jpg",
                                        fit: BoxFit.scaleDown),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                                "Integer eu neque nec lorem tincidunt rhoncus scelerisque at metus. Pellentesque hendrerit commodo felis ut feugiat. Aenean tristique a purus et sollicitudin. In fringilla, sem ornare dignissim lacinia, risus mi consequat lorem, id pretium enim purus ut libero. Morbi porta dolor a mi viverra, a finibus turpis suscipit. "),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 150,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Yesenia",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('"Muy buen servicio"'),
                                      Text("\☆\☆\☆\☆\☆")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 150,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Damian",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('"Muy amables"'),
                                      Text("\☆\☆\☆\☆\☆")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 150,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Erick",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('"Volvería a contratarlos"'),
                                      Text("\☆\☆\☆\☆")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            ListTile(
                              leading: Icon(
                                Icons.attach_money,
                                color: Colors.yellow,
                              ),
                              title: Text("COSTOS DEL SERVICIO\n"),
                              subtitle: Text(
                                "\$150 Mxn. Servicio Base\n ",
                                style: TextStyle(color: Colors.green),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      PaymentMethodsReview()));
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                leading: Image.asset(
                                  "assets/images/visa.png",
                                  height: 25,
                                ),
                                title: const Text("Método de pago"),
                                subtitle: const Text(
                                  "Visa 371",
                                  style: TextStyle(color: Colors.blue),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      ContratarDonMauricio()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 78, 121, 186),
                        ),
                        child: const Text(
                          "CONTRATAR",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
