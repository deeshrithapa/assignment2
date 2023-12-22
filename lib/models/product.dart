import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String name;
  double price;

  Product({required this.name, required this.price});
}

Future<List<Product>> getOrderedProducts(String userId) async {
  List<Product> products = [];

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
      .collection('order')
      .where('userId', isEqualTo: userId) // Filter by userId
      .get();

  querySnapshot.docs.forEach((doc) {
    Map<String, dynamic> data = doc.data()!;
    String productName = data['productName']; // Corrected field name
    double productPrice = data['price'];

    Product product = Product(name: productName, price: productPrice);
    products.add(product);
  });

  return products;
}

