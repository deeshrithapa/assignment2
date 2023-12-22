import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../models/Cart.dart';
import '../../models/cart_provider.dart';
import 'CartPage.dart';
import 'Dashboard.dart';
import 'SearchPage.dart';
import 'SettingPage.dart';

class CVDetails extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<CVDetails> {
  List<Map<String, dynamic>> ceraveProducts = [];

  // Fetch data from Firestore
  Future<void> fetchDataFromFirestore() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('product-details') // Replace with your actual collection name
          .where('brand', isEqualTo: 'Cerave')
          .get();

      setState(() {
        ceraveProducts = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      });

      // Debugging: Print the retrieved data
      print('Fetched Data: $ceraveProducts');
    } catch (e) {
      print('Error fetching data from Firestore: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the selected page
    switch (index) {
      case 0:
      // Home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => dashpage()),
        );
        break;
      case 1:
      // Search page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
        break;
      case 2:
      // Cart page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => cartpage()),
        );
        break;
      case 3:
      // Settings page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingPage()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SkinSync',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'CeraVe Products',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.73,
                    ),
                    itemCount: ceraveProducts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Expanded(
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Color(ceraveProducts[index]['color'] ?? 0xFF000000),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 55,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 55,
                                          backgroundColor: Color(ceraveProducts[index]['color'] ?? 0xFF000000).withOpacity(0.5),
                                        ),
                                      ),
                                      Image.network(ceraveProducts[index]['img'], height: 160),

                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Text(
                              ceraveProducts[index]['name'] ?? '',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                            ),

                            Text(
                              'Rs.' + (ceraveProducts[index]['price'] ?? 0).toString(),
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                            ),

// ... (existing code)

                            ElevatedButton(
                              onPressed: () {
                                var cartProvider = context.read<CartProvider>();
                                cartProvider.addToCart(CartItem(
                                  name: ceraveProducts[index]['name'],
                                  price: double.parse(ceraveProducts[index]['price'].toString()),
                                  imagePath: ceraveProducts[index]['img'],
                                ));

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added to Cart: ${ceraveProducts[index]['name']}'),
                                  ),
                                );
                              },
                              child: Text('Add to Cart'),
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            onTabChange: (index) {
              _onTabChange(index);
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'My Cart',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Profile',
              ),
            ],
            selectedIndex: 0,
          ),
        ),
      ),
    );
  }
}
