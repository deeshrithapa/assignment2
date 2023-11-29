import 'package:flutter/material.dart';
import 'package:skin_sync/components/button.dart';

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
          child: Column(
            children: [
              SizedBox(height: 20,),
              //project title
                Text("Skin Sync",
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              SizedBox(height: 10,),

              //image
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("lib/skincare.png", height: 550, width: 350,),
              ),

              //subtitle
              Text("Your ultimate skincare hub.",
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),),

              SizedBox(height: 40,),

              //get started button
              Container(
                height: 50,
                width: 410,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.brown.shade200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Get Started",
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
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
