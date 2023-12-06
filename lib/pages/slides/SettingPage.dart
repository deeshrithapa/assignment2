import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skin_sync/pages/authentication/firstpage.dart';
import 'package:skin_sync/pages/slides/Terms.dart';

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
  onChangedFunction2(bool newValue2){
    setState(() {
      valNotify2 = newValue2;
    });
  }

  int _selectedIndex=0;

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
            SizedBox(height: 40),
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
            SizedBox(height: 10),
            buildAccountOption(context, "Order History"),
            buildAccountOption(context, "Terms and Services"),
            SizedBox(height: 40),
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
            SizedBox(height: 10),
            buildNotificationOption("Account Active", valNotify1, onChangedFunction1),
            buildNotificationOption("Dark Theme", valNotify2, onChangedFunction2),
            SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> firstpage()),);
                },
                child: Text("Sign Out", style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2.2,
                  color: Colors.black
                )),
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
            MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
          );
        } else {
          // Handle other options if needed
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
                  color: Colors.grey[600]),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey)
          ],
        ),
      ),
    );
  }

  /*GestureDetector buildAccountOption (BuildContext context, String title){
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Option 1"),
                Text("Option 2")

              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
              },
                  child: Text("Close")
              )

            ],
          );


        });

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]
            )),
            Icon(Icons.arrow_forward_ios, color: Colors.grey)

          ],
        ),
      ),
    );
  }*/
}