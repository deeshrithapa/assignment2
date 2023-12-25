import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/order.dart';

class MyAppOrder {
  final String userId;
  final double price;
  final String productName;

  MyAppOrder({
    required this.userId,
    required this.price,
    required this.productName,
  });

  factory MyAppOrder.fromDocumentSnapshot(DocumentSnapshot doc) {
    return MyAppOrder(
      userId: doc['userId'],
      price: doc['price'].toDouble(),
      productName: doc['productName'],
    );
  }
}

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late Future<List<MyAppOrder>> orderHistoryFuture;

  @override
  void initState() {
    super.initState();
    User? user = _auth.currentUser;
    if (user != null) {
      //print('User ID: ${user.uid}');
      orderHistoryFuture = _getOrderHistory(user.uid);
    } else {
      //print('User is not authenticated.'); // This should not be printed if a user is logged in.
      orderHistoryFuture = Future.value([]);
    }
  }


  Future<List<MyAppOrder>> _getOrderHistory(String userId) async {
    try {
      //print('Fetching all orders from Firestore...'); // Debug print
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('order')
          .where('userId', isEqualTo: userId)
          .get(); // Fetch all documents without filtering by userId

      //print('Number of orders retrieved: ${querySnapshot.size}'); // Debug print
/*
      List<MyAppOrder> orderHistory = querySnapshot.docs
          .map((doc) => MyAppOrder.fromQueryDocumentSnapshot(doc))
          .toList();*/

      //return orderHistory;
      return querySnapshot.docs
          .map((doc) => MyAppOrder.fromDocumentSnapshot(doc))
          .toList();
    } catch (error) {
      print('Error retrieving order history: $error'); // Debug print
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: FutureBuilder<List<MyAppOrder>>(
        future: orderHistoryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<MyAppOrder> orderHistory = snapshot.data!;
            if (orderHistory.isEmpty) {
              return Center(child: Text('No order history found.'));
            } else {
              return ListView.builder(
                itemCount: orderHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('userid ID: ${orderHistory[index].userId}'),
                    trailing: Text('Price: \$${orderHistory[index].price.toStringAsFixed(2)}'),
                    subtitle: Text('Product: ${orderHistory[index].productName}'),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
