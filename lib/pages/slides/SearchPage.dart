import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skin_sync/pages/slides/CartPage.dart';
import 'package:skin_sync/pages/slides/serum.dart';
import 'package:skin_sync/pages/slides/spf.dart';
import 'Dashboard.dart';
import 'SettingPage.dart';
import 'facewash.dart';
import 'moisturizer.dart';



class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  int _selectedIndex=0;
  String _currentQuery = ""; // Declare _currentQuery at the class level

  List<String> images = [
    "https://iambodyboom.com/cdn/shop/collections/Bodyboom_Shopify_Banner_1_-_Desktop_No_Text.png?v=1682531929&width=3200",
    "https://www.dotandkey.com/cdn/shop/collections/Catagory-desktop-banner_2.png?v=1610816960",
    "https://cdn.shopify.com/s/files/1/0567/1937/6535/files/tcfs_shopify_slideshow_-DESKTOP_4.png?v=1630838217",
  ];
  List<String> additionalimages = [
    "lib/images/spf.png",
    "lib/images/serum.png",
  ];
  List<String> additionalimages1 = [
    "lib/images/moisturizer.png",
    "lib/images/facewash.png",
  ];
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
  void onSearch(String query) {
    // Check the query and navigate accordingly
    switch (query.toLowerCase()) {
      case "serum":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => serumDetail()),
        );
        break;
      case "spf":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => spfDetail()),
        );
        break;
      case "facewash":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => facewashDetail()),
        );
        break;
      case "cleanser":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => facewashDetail()),
        );
        break;
      case "suncreen":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => spfDetail()),
        );
        break;
      default:
      // Show a pop-up message for other queries
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("No Products Found"),
              content: Text("Sorry, we couldn't find any products for your search."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        break;
    }
  }

  void onImageTapped(int index) {
    switch (index) {
      case 0:
      // Navigate to a detail page for the first additional image
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => spfDetail()),
        );
        break;
      case 1:
      // Navigate to a detail page for the second additional image
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => serumDetail()),
        );
        break;
      case 2:
      // Navigate to a detail page for the second additional image
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => moisturizerDetail()),
        );
        break;
      case 3:
      // Navigate to a detail page for the second additional image
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => facewashDetail()),
        );
        break;
    // Add more cases if needed...
    }
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 50.0)),
              Text("SkinSync",
                  style: GoogleFonts.aladin(fontSize: 40, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,)
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for products',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            //code to clear the text field
                            setState(() {
                              _currentQuery = "";
                            });
                          },
                        ),
                      ),
                      onChanged: (query) {
                        setState(() {
                          _currentQuery = query;
                        });
                      },
                      onSubmitted: (query) {
                        // Show the pop-up message when the user presses Enter
                        onSearch(query);
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Call the onSearch function with the current query
                      onSearch(_currentQuery);
                    },
                  ),
                ],
              ),
              SizedBox(height: 10), // some space between search bar and image
              Container(
                height: 200,
                child: CarouselSlider(
                  items: images.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        url,
                        height: 150,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),

              Container(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: additionalimages.asMap().entries.map((entry) {
                    int index = entry.key;
                    String assetPath = entry.value;

                    return GestureDetector(
                      onTap: () {
                        // Handle tap for the specific image (index)
                        onImageTapped(index);
                      },
                      child: Image.asset(
                        assetPath,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: additionalimages1.asMap().entries.map((entry) {
                    int index = entry.key;
                    String assetPath = entry.value;

                    return GestureDetector(
                      onTap: () {
                        // Handle tap for the specific image (index)
                        onImageTapped(index + additionalimages.length);
                      },
                      child: Image.asset(
                        assetPath,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
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
            selectedIndex: 1,
          ),
        ),
      ),
    );
  }
}

void onSearch(String query) {
  //code to perform search based on the query
}