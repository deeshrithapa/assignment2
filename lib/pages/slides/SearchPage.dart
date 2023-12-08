import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Dashboard.dart';
import 'DetailPage.dart';
import 'SettingPage.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  int _selectedIndex=0;

  List<String> images = [
    "https://iambodyboom.com/cdn/shop/collections/Bodyboom_Shopify_Banner_1_-_Desktop_No_Text.png?v=1682531929&width=3200",
    "https://www.dotandkey.com/cdn/shop/collections/Catagory-desktop-banner_2.png?v=1610816960",
    "https://cdn.shopify.com/s/files/1/0567/1937/6535/files/tcfs_shopify_slideshow_-DESKTOP_4.png?v=1630838217",
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
            children: [
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Text(
                "Skin Sync",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
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
              SizedBox(height: 20), // some space between search bar and image
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        images[index],
                        height: 150,
                        width: 300,
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