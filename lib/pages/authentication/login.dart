import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_sync/pages/authentication/signup.dart';
import 'package:skin_sync/pages/slides/Dashboard.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signInWithEmail() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Successfully signed in
      print("Signed in: ${userCredential.user?.email}");

      // Navigate to the dashboard
      Navigator.push(context, MaterialPageRoute(builder: (context) => dashpage()));
    } catch (e) {
      // Handle errors
      print("Error: $e");

      // Show a flushbar with an error message
      _showErrorFlushbar("Invalid email or password");
    }
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
                            signInWithEmail();
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
}
