import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:skin_sync/pages/slides/Dashboard.dart';
import 'package:skin_sync/pages/slides/SettingPage.dart';
import '../../models/Cart.dart';
import '../../models/cart_provider.dart';
import 'SearchPage.dart';

class cartpage extends StatefulWidget {
  const cartpage({Key? key});

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
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
      // No need to navigate to the same page again
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
    var cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          CartItem item = cartProvider.cartItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Price: \Rs. ${item.price.toString()}'),
            leading: Container(
              width: 80.0,
              height: 80.0,
              child: Image.asset(
                '${item.imagePath}',
                fit: BoxFit.cover,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cartProvider.removeFromCart(item);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                child: Text('Checkout'),
              ),
              SizedBox(height: 16),
              GNav(
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
                selectedIndex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
