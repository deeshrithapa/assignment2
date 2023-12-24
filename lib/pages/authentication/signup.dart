import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_sync/pages/authentication/auth_services.dart';
import 'package:skin_sync/pages/authentication/login.dart';
import 'package:skin_sync/pages/slides/Dashboard.dart';

class signuppage extends StatefulWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  Image.asset("lib/images/skinsync.png", height: 200, width: 150,),
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
                  ),
                ],
              ),

              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(right: 35, left: 35),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: fullNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Full Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: mobileNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          } else if (value.length != 10) {
                            return 'Mobile number should be 10 digits';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Mobile Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email address';
                          } else if (!value.contains('@')) {
                            return 'Invalid email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 6) {
                            return 'Password should be at least 6 characters';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Validation passed, attempt to create an account
                              signUpWithEmailAndPassword();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.brown.shade200,
                          ),
                          child: Text("Sign Up", style: GoogleFonts.aladin(color: Colors.white, fontSize: 30)),
                        ),
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Or Sign in with",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      GestureDetector(
                        onTap: () {
                          signInWithGoogle(context);
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal, // Added to allow horizontal scrolling if needed
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                            children: [
                              Image.asset("lib/images/google.png", height: 50, width: 30,),
                              SizedBox(width: 35),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUpWithEmailAndPassword() async {
    try {
      UserCredential authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Get the UID of the newly created user
      String uid = authResult.user!.uid;

      // Store additional user details in Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'fullName': fullNameController.text.trim(),
        'address': addressController.text.trim(),
        'mobileNumber': mobileNumberController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        // Add other fields as needed
      });

      // Navigate to the dashboard or perform other actions
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => dashpage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth exceptions
      print('FirebaseAuthException: ${e.message}');
      // Show user-friendly error message (SnackBar or Dialog)
    } catch (e) {
      print(e);
      // Show a generic error message (SnackBar or Dialog)
    }
  }
}





