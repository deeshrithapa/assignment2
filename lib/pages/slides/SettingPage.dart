import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:skin_sync/models/cart_provider.dart';
import 'package:skin_sync/pages/authentication/firstpage.dart';
import 'package:skin_sync/pages/slides/CartPage.dart';
import 'package:skin_sync/pages/slides/conditions.dart';
import 'package:skin_sync/pages/slides/contactus.dart';
import 'package:skin_sync/pages/slides/update.dart';
import 'Dashboard.dart';
import 'DetailPage.dart';
import 'SearchPage.dart';
import 'order_history.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);
  @override
  _SettingPageState createState() => _SettingPageState();
}
class _SettingPageState extends State<SettingPage>{

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title:
        Text("Profile Settings",
            style:TextStyle(fontSize: 22) ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text(
                    "Account", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
                )
              ],
            ),
            Divider(height: 20, thickness: 1),

            buildAccountOption(context, "Update Information"),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.volume_up_outlined, color: Colors.blue),
                SizedBox(width: 10),
                Text("Notifications", style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ))

              ],
            ),
            Divider(height: 20, thickness: 1),
            buildNotificationOption("Account Active", valNotify1, onChangedFunction1),
            //buildNotificationOption("Dark Theme", valNotify2, onChangedFunction2),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.call, color: Colors.blue),
                SizedBox(width: 10),
                Text("Customer Care", style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ))

              ],
            ),
            Divider(height: 20, thickness: 1),
            buildAccountOption(context, "Contact Us"),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.terminal_sharp, color: Colors.blue),
                SizedBox(width: 10),
                Text("Legal and Policies", style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ))

              ],
            ),
            Divider(height: 20, thickness: 1),
            buildAccountOption(context, "Terms and Services"),
            buildAccountOption(context, "About App"),
            SizedBox(height: 20,),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onPressed: () {
                  // 1. Reference to CartProvider
                  var cartProvider = context.read<CartProvider>();

                  // 2. Clear the cart items
                  cartProvider.clearCart();

                  // 3. Navigate back to the authentication page
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => firstpage()),
                        (Route<dynamic> route) => false, // This ensures we remove all previous routes
                  );
                },
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 2.2,
                      color: Colors.black
                  ),
                ),
              ),


            ),
            SizedBox(height: 20),



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
  Padding buildNotificationOption(String title, bool value, Function onChangeMethod){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]
          )),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }
  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        if (title == "Terms and Services") {
          // Navigate to Terms and Services page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => conditionPage()),
          );
        } else if (title == "Update Information") {
          // Navigate to Update Information page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpdatePage()),
          );
        } else if (title == "Contact Us") {
          // Navigate to Contact Us page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => contactusPage()),
          );
        }
        else if (title == "About App") {
          // Show a popup with an image when the "About App" option is selected
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.brown.shade50,                content: Container(
                  height: 400,
                  width: 250,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                          Image.asset(
                          'lib/images/skinsync.png', // Replace with your image asset path
                          height: 330, // Set height as needed
                          width: 300, // Set width as needed
                          fit: BoxFit.contain, // Adjust the fit property as needed
                        ),
                      SizedBox(height: 16),
                      Text('Skin Sync',
                        style: GoogleFonts.alegreya(fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Close',
                      style: TextStyle(color: Colors.indigo), // Set desired text color here (e.g., red)
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }



}