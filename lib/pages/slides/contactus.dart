import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skin_sync/pages/slides/SearchPage.dart';
import 'package:skin_sync/pages/slides/SettingPage.dart';

import 'CartPage.dart';
import 'Dashboard.dart';

class contactusPage extends StatefulWidget {
  contactusPage({Key? key}) : super(key: key);
  @override
  State<contactusPage> createState() => _contactusPageState();
}

class _contactusPageState extends State<contactusPage> {
  bool valNotify1= true;
  bool valNotify2 = false;


  onChangedFunction1(bool newValue1){
    setState(() {
      valNotify1 = newValue1;
    });
  }


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
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title:
        Text('Contact Us'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 50, right: 50, top: 50),
        child: Column(
          children: <Widget>[
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Text(
                    "Contact Information",
                    style: GoogleFonts.alegreya(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please contact us for any questions or comments regarding these Terms and Conditions.',
                    style: GoogleFonts.alegreya(fontSize: 18),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Icon(Icons.call, color: Colors.black),
                      Text(
                        'Contact Number:',
                        style: GoogleFonts.alegreya(
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '+977 9816877218',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '+977 9813415273',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '+977 9869030521',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.black),
                      Text(
                        'Email:',
                        style: GoogleFonts.alegreya(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'skinsync@gmail.com',
                    style: TextStyle(fontSize: 14),
                  ),
                  // Add more terms and conditions here...
                ],
              ),
            ),
          ],
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
            selectedIndex: 3,
          ),
        ),
      ),

    );
  }
}
