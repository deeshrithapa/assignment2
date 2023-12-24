import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


import '../../models/cart_provider.dart';
import '../map/map_page.dart';
import 'Dashboard.dart';

class OrderConfirmPage extends StatefulWidget {
  @override
  _OrderConfirmPageState createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  LatLng? selectedLocation; // Assuming LatLng is the type of your location data

  
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

  Future<void> saveCartItemsToFirestore({
    required BuildContext context,
  }) async {
    try {
      CollectionReference cartItemsCollection = FirebaseFirestore.instance.collection('order');
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) { // Check if user is logged in
        var cartProvider = context.read<CartProvider>();

        // Create a list to store cart items data
        List<Map<String, dynamic>> cartItemsData = [];

        for (var item in cartProvider.cartItems) {
          cartItemsData.add({
            'productName': item.name,
            'price': item.price,
            // Add other properties as needed
          });
        }

        // Save cart items to Firestore under the user's UID
        await cartItemsCollection.doc(user.uid).set({
          'items': cartItemsData,
          'timestamp': Timestamp.now(),
        });

        print('Cart items saved to Firestore successfully!');
      } else {
        print('User is not logged in.');
        // Handle the case where the user is not logged in if necessary
      }
    } catch (error) {
      print('Error saving cart items to Firestore: $error');
    }
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
            GestureDetector(
              onTap: () async {
                // Navigate to the MapSample page to select a location
                LatLng? location = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapSample(),
                  ),
                );
                setState(() {
                  selectedLocation = location;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  selectedLocation != null
                      ? 'Selected Location: ${selectedLocation.toString()}'
                      : 'Select Location',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  // Save cart items to Firestore (similar to what you had in your cart page)
                  // For simplicity, you can create a function or method in your provider or another service to handle this.
                  // You may need to modify this part to suit your exact cart management logic.
                  await saveCartItemsToFirestore(context: context);

                  // Show a pop-up message indicating the order has been confirmed
                  await _showOrderConfirmationDialog();

                  // Navigate to the dashboard page after confirming the order
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => dashpage()),
                  );
                } else {
                  print('User is not logged in.');
                }
              },
              child: Text('Confirm Order'),
            ),

          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OrderConfirmPage(),
  ));
}
