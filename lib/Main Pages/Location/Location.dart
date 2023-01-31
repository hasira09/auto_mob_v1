import 'package:auto_mob_v1/Main%20Pages/Location/Location_Poly.dart';
import 'package:auto_mob_v1/front_end/home_page.dart';
import 'package:flutter/material.dart';

import 'CurrentLocation.dart';
import 'MapScreen.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Location",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
          icon: Image.asset("assets/icons/back.png"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        elevation: 0.0,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const MapScreen();
                  }));
                },
                child: const Text("Map Location")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const CurrentLocation();
                  }));
                },
                child: const Text("Current Location")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const LocationPoly();
                  }));
                },
                child: const Text("Polyline Location"))
          ],
        ),
      ),
    );
  }
}
