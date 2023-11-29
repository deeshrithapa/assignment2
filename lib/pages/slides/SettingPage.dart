import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);
  @override
  _SettingPageState createState() => _SettingPageState();
}
class _SettingPageState extends State<SettingPage>{

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
    );


}
}