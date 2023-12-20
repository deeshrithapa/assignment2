import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(27.686382, 85.315399),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  bool showMap = false;

  @override
  void initState() {
    super.initState();
    showMapFunc();
    _loadMapStyles();
  }

  String? mapThemeData;

  Future<void> _loadMapStyles() async {
    mapThemeData =
    await rootBundle.loadString('assets/raw/maptheme.json'); // Replace with your actual file path
  }

  showMapFunc() {
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      setState(() {
        showMap = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(  // Wrap with a Container
      height: 200,  // Set the desired height
      width: size.width,  // Set the desired width
      child: Stack(
        children: [
          showMap
              ? GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            markers: {
              const Marker(
                markerId: MarkerId('Kupondole'),
                position: LatLng(27.686382, 85.315399),
                infoWindow: InfoWindow(
                  title: "Kupondele",
                  snippet: "PCPS",
                ),
              ),
            },
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(mapThemeData!);
              _controller.complete(controller);
            },
          )
              : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(15),
              height: 60,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );
  }
}
