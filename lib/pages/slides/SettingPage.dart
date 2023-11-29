import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);
  @override
  _SettingPageState createState() => _SettingPageState();
}
class _SettingPageState extends State<SettingPage>{

  int _selectedIndex=0;

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
                "Account Setting",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
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
              setState(() {
                _selectedIndex = index;
              });

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
                icon: Icons.settings,
                text: 'Profile',
              ),
            ],
            selectedIndex: 2,
          ),
        ),
      ),
    );

  }
}