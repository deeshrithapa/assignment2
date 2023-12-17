import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../components/search_detailpage.dart';
import '../../models/Cart.dart';
import '../../models/cart_provider.dart';
import 'CartPage.dart';
import 'Dashboard.dart';
import 'SearchPage.dart';
import 'SettingPage.dart';

class serumDetail extends StatefulWidget {
  @override
  _serumDetailPageState createState() => _serumDetailPageState();
}

class _serumDetailPageState extends State<serumDetail> {
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
              // Add the heading and subheading
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
                      'Serum Products',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              // Add CarouselSlider
              SizedBox(height: 20), // Adjust the height based on your preference

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
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Color(search_detailpage[index + 4]['color']),
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
                                          backgroundColor: Color(search_detailpage[index + 4]['color']).withOpacity(0.5),
                                        ),
                                      ),
                                      Image.asset(
                                        search_detailpage[index + 4]['image'], // Adjust index to start from 2
                                        height: 160,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              search_detailpage[index + 4]['name'],
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              r'Rs.' + search_detailpage[index + 4]['price'],
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            // Add to Cart Button
                            ElevatedButton(
                              onPressed: () {
                                // Get the CartProvider instance
                                var cartProvider = context.read<CartProvider>();

                                // Add the selected item to the cart
                                cartProvider.addToCart(
                                  CartItem(
                                    name: search_detailpage[index + 4]['name'],
                                    price: double.parse(search_detailpage[index + 4]['price']),
                                    imagePath: search_detailpage[index + 4]['image'],
                                  ),
                                );

                                // Show a snackbar or navigate to the cart page
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added to Cart: ${search_detailpage[index + 4]['name']}'),
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
            selectedIndex: 1,
          ),
        ),
      ),
    );
  }
}
