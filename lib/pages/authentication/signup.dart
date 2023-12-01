import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_sync/pages/authentication/auth_services.dart';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/skinsync.png", height: 200, width: 150,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("SkinSync",
                      style: GoogleFonts.aladin(fontSize: 40, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,)
                     ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Register Here",
                        style: GoogleFonts.aladin(fontSize: 25, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,)
                    ),],
                ),

                Container(
                  padding: EdgeInsets.only(right: 35, left: 35),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Full Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Address",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Mobile Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        height: 50,width: 150,
                        decoration: BoxDecoration(color: Colors.brown.shade200,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text("Sign In",
                              style: GoogleFonts.aladin(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text("Or Sign in with",
                              style: TextStyle(
                                  fontSize: 14,),),
                        ],
                      ),
            GestureDetector(
              onTap: () {
                signInWithGoogle(context);
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Added to allow horizontal scrolling if needed
                padding: const EdgeInsets.only(left: 150),
                child: Row(
                  children: [
                    Image.asset("lib/google.png", height: 50, width: 30,),
                    SizedBox(width: 35),
                  ],
                ),
              ),
            ),
],
        ),
                  ),
                ],
          ),
        ),
      ),
    );
  }
}
