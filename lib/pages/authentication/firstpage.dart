import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:skin_sync/pages/authentication/login.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              //project title
                Text("Skin Sync",
            style: GoogleFonts.aladin(fontSize: 60),),
                

              SizedBox(height: 10,),

              //image
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset("lib/images/skincare.png", height: 450, width: 350,),
              ),

              //subtitle
              Text("Your ultimate skincare hub.",
                  style: GoogleFonts.aladin(fontSize: 30),),

              SizedBox(height: 40,),

              //get started button
              Container(
                height: 50,
                width: 410,
                child: ElevatedButton(
                  onPressed: (){
                    //Navigate
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> loginpage()),);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown.shade200,
                    // Set the background color of the button
                    ),
                  child: Text("Get Started",
                    style: GoogleFonts.aladin(color: Colors.white, fontSize: 30),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
