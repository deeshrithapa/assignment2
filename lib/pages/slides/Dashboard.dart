import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skin_sync/pages/slides/CartPage.dart';
import 'package:skin_sync/pages/slides/MamaEarthDetails.dart';
import 'package:skin_sync/pages/slides/SearchPage.dart';
import 'package:skin_sync/pages/slides/SettingPage.dart';

import 'CeraVeDetails.dart';
import 'DC_detailpage.dart';
import 'DetailPage.dart';
import 'conditions.dart';

class dashpage extends StatefulWidget {
  const dashpage({super.key});

  @override
  State<dashpage> createState() => _dashpageState();
}

class _dashpageState extends State<dashpage> {
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
  void _goToMamaEarthDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MamaEarthDetails()),
    );
  }
  void _goToDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage()),
    );
  }
  void _goToCeraVeDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CVDetails()),
    );
  }
  void _goToDCDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DC_detailpage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50),
                child:  Text("SkinSync",
                    style: GoogleFonts.aladin(fontSize: 40, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,)
                ),
              ),
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
                  'lib/images/cerave1.png',
                  'lib/images/DermaCo.png',
                  'lib/images/mamaearth1.png',
                  'lib/images/cetaphil2.png',
                ].map((item) => Image.asset(item, fit: BoxFit.cover)).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(top:20,),
                child: Text("Top Brand Picks",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, // Added this line for center alignment
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                ),
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: _goToCeraVeDetailsPage,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                        child: Image.asset(
                          'lib/images/cerave2.png', // Replace with your image asset path
                          width: 400,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Cerave",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             Container(
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                ),
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: _goToDetailsPage,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                        child: Image.asset(
                          'lib/images/cetaphil1.png', // Replace with your image asset path
                          width: 400,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Cetaphil",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                ),
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: _goToDCDetailsPage,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                        child: Image.asset(
                          'lib/images/derma.png', // Replace with your image asset path
                          width: 400,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "The DermaCo",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                ),
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: _goToMamaEarthDetailsPage,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                        child: Image.asset(
                          'lib/images/mamaearth2.png', // Replace with your image asset path
                          width: 400,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Mamaearth",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
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

void onSearch(String query) {
  //code to perform search based on the query
}