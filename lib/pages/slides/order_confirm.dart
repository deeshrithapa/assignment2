import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'Dashboard.dart';

class OrderConfirmPage extends StatefulWidget {
  @override
  _OrderConfirmPageState createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  late GoogleMapController mapController;
  LatLng? userLocation;

  Future<void> _showOrderConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Confirmed'),
          content: Text('Your order has been confirmed!'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Delivery Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Delivery Address on Map',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(0, 0),
                  zoom: 15.0,
                ),
                markers: userLocation != null
                    ? {
                  Marker(
                    markerId: MarkerId('userLocation'),
                    position: userLocation!,
                    infoWindow: InfoWindow(title: 'Delivery Location'),
                  ),
                }
                    : {},
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Show a pop-up message indicating the order has been confirmed
                await _showOrderConfirmationDialog();

                // You can perform additional actions here if needed

                // Navigate to the dashboard page after confirming the order
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => dashpage()),
                );
              },
              child: Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      // Get the user's current location and move the camera to that position
      _getCurrentLocation();
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        userLocation = LatLng(position.latitude, position.longitude);
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: userLocation!,
              zoom: 15.0,
            ),
          ),
        );
      });
    } catch (e) {
      print('Error getting current location: $e');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: OrderConfirmPage(),
  ));
}
