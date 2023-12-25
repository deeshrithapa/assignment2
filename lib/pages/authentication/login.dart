import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_sync/pages/authentication/signup.dart';
import 'package:skin_sync/pages/slides/Dashboard.dart';

import '../slides/Admin.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Function to show flushbar for error messages
  void _showErrorFlushbar(String message) {
    Flushbar(
      message: message,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red, // Customize the background color
      flushbarPosition: FlushbarPosition.TOP,
    )..show(context);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/images/skinsync.png", height: 200, width: 150,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("SkinSync",
                        style: GoogleFonts.aladin(fontSize: 60, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,)
                    ),
                  ],
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login Here",
                        style: GoogleFonts.aladin(fontSize: 30, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,)
                    ),],
                ),

                SizedBox(height: 30,),

                Container(
                  padding: EdgeInsets.only(right: 35, left: 35),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(height: 50,),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(height: 50,),

                      Container(
                        height: 50,width: 150,
                        decoration: BoxDecoration(color: Colors.brown.shade200,
                            borderRadius: BorderRadius.circular(30)),
                        child: ElevatedButton(
                          onPressed: (){
                            loginScreen();
                            //Navigate
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=> dashpage()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.brown.shade200, // Set the background color of the button
                          ),
                          child: Text("Login", style: GoogleFonts.aladin(color: Colors.white, fontSize: 30)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dont have an account?", style: TextStyle(fontSize: 12),),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => signuppage()),);
                            },
                            child: Text("Sign up here", style: TextStyle(
                                color:Colors.blueAccent, fontSize: 12, decoration: TextDecoration.underline),),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
  void loginScreen() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Successful sign-in
        print("User is signed in");

        // Check for admin credentials
        if (email == "admin@gmail.com") {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminPage()));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashpage()));
        }
      }
    } catch (e) {
      // Unsuccessful sign-in
      print("Error Occurred: $e");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Wrong email or password. Please try again."),
            actions: [
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
    }
  }
}
