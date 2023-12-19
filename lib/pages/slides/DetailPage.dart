import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import CarouselSlider package
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../components/data_detailpage.dart';
import '../../components/item_detailpage.dart';
import '../../models/Cart.dart';
import '../../models/cart_provider.dart';
import 'CartPage.dart';
import 'Dashboard.dart';
import 'SearchPage.dart';
import 'SettingPage.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedIndex=0;
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
                      'Cetaphil Products',
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
CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16/9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                ),
                items: [
                  'lib/images/cetaphil.png',
                  'lib/images/cetaphil1.png',
                  'lib/images/cetaphil2.png',
                  // Add more images as needed
                ].map((item) => Image.asset(item, fit: BoxFit.cover)).toList(),
              ),


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
                        onTap: () {
                          // Handle the onTap event for the entire item
                          print('Item tapped for product: ${data_detailpage[index]['name']}');

                          // Navigate to the item detail page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Item(
                                itemName: data_detailpage[index]['name'],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Color(data_detailpage[index]['color']),
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
                                          backgroundColor: Color(data_detailpage[index]['color']).withOpacity(0.5),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Handle the onTap event for the image
                                          print('Image tapped for product: ${data_detailpage[index]['name']}');
                                          // You can add navigation logic or any other action here
                                        },
                                        child: Image.asset(
                                          data_detailpage[index]['image'],
                                          height: 160,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(data_detailpage[index]['name'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                            Text(
                              r'Rs.' + data_detailpage[index]['price'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                var cartProvider = context.read<CartProvider>();
                                cartProvider.addToCart(CartItem(
                                  name: data_detailpage[index + 10]['name'],
                                  price: double.parse(data_detailpage[index + 10]['price']),
                                  imagePath: data_detailpage[index + 10]['image'],
                                ),);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added to Cart: ${data_detailpage[index + 10]['name']}'),
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
          padding: const EdgeInsets.symmetric( horizontal: 15, vertical:20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            onTabChange: (index){
              _onTabChange(index);
            },

            padding: EdgeInsets.all(16),
            tabs: const[

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
