import 'dart:async';
import 'dart:convert';
import 'package:auto_mob_v1/Main%20Pages/Location/PolylineResponses.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Location.dart';
import 'package:http/http.dart' as http;

class LocationPoly extends StatefulWidget {
  const LocationPoly({Key? key}) : super(key: key);

  @override
  State<LocationPoly> createState() => _LocationPolyState();
}

class _LocationPolyState extends State<LocationPoly> {
  static const CameraPosition initialPosition =
      CameraPosition(target: LatLng(6.9271, 79.8612), zoom: 14);

  final Completer<GoogleMapController> _controller = Completer();

  String totalDistance = "";
  String totalTime = "";

  String apiKey = "AIzaSyD7igEoM1rOEPlTWPxUWysFEH03hQ7Eff4";

  LatLng origin = const LatLng(6.92989383762, 79.8615940228);
  LatLng destination = const LatLng(6.8540, 80.0929);

  PolylineResponse polylineResponses = PolylineResponse();

  Set<Polyline> polylinePoints = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Shuttle Location",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("assets/icons/back.png"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LocationPage()));
          },
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            polylines: polylinePoints,
            zoomControlsEnabled: false,
            initialCameraPosition: initialPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Total Distance:- " + totalDistance),
                Text("Total Time:- " + totalTime),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          drawPolyline();
        },
        child: const Icon(Icons.bus_alert),
      ),
    );
  }

  void drawPolyline() async {
    var response = await http.post(Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?key=" +
            apiKey +
            "&units=metric&origin" +
            origin.latitude.toString() +
            "," +
            origin.longitude.toString() +
            "&destination" +
            destination.latitude.toString() +
            "," +
            destination.longitude.toString() +
            "&mode=driving"));

    print(response.body);

    polylineResponses = PolylineResponse.fromJson(jsonDecode(response.body));

    totalDistance = polylineResponses.routes![1].legs![1].distance!.text!;
    totalTime = polylineResponses.routes![1].legs![1].duration!.text!;

    for (int i = 0;
        i < polylineResponses.routes![1].legs![1].steps!.length;
        i++) {
      polylinePoints.add(Polyline(
          polylineId: PolylineId(polylineResponses
              .routes![1].legs![1].steps![1].polyline!.points!),
          points: [
            LatLng(
                polylineResponses
                    .routes![1].legs![1].steps![i].startLocation!.lat!,
                polylineResponses
                    .routes![1].legs![0].steps![i].startLocation!.lng!),
            LatLng(
                polylineResponses
                    .routes![1].legs![1].steps![i].endLocation!.lat!,
                polylineResponses
                    .routes![1].legs![1].steps![i].endLocation!.lng!),
          ],
          width: 3,
          color: Colors.red));
    }

    setState(() {});
  }
}
