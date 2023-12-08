import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'DetailPage.dart';
import 'SearchPage.dart';
import 'SettingPage.dart';

class dashpage extends StatefulWidget {
  const dashpage({super.key});

  @override
  State<dashpage> createState() => _dashpageState();
}

class _dashpageState extends State<dashpage> {
  int _selectedIndex=0;

  List<String> imagePaths = [
    'lib/images/cetaphil.png',
    'lib/images/derma.png',
    'lib/images/cerave1.png',
    'lib/images/ordinary2.png',
    // Add more image paths as needed
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
          MaterialPageRoute(builder: (context) => detailpage()),
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            <Widget>[
              // AppBar(
              //   backgroundColor: Colors.white,
              //   leading:  Image.asset("lib/skincare.png", height: 550, width: 350,),
              //   ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Text(
                  "Skin Sync",
                  style: GoogleFonts.aladin(fontSize: 40,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,)
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for products and more',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            //code to clear the text field
                          },
                        ),
                      ),
                      onChanged: (query) {
                        onSearch(query);
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      //code to perform search
                    },
                  ),
                ],
              ),

              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Padding(padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      imagePaths[index],
                      width: 300,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    );
                  },

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