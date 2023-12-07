import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dashpage extends StatefulWidget {
  const dashpage({super.key});

  @override
  State<dashpage> createState() => _dashpageState();
}

class _dashpageState extends State<dashpage> {
  final List<String> imagePaths = [
    'lib/skinsync.png',
    'lib/skincare.png',
    'lib/TheOrdinary.png',
    'lib/TheDermaCo.png',
    // Add more image paths as needed
  ];
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
            children:
            <Widget>[
              // AppBar(
              //   backgroundColor: Colors.white,
              //   leading:  Image.asset("lib/skincare.png", height: 550, width: 350,),
              //   ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Text(
                  "Skin Sync",
                  style: GoogleFonts.aladin(fontSize: 40, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,)
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for products and more',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            //code to clear the text field
                          },
                        ),
                      ),
                      onChanged: (query) {
                        onSearch(query);
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      //code to perform search
                    },
                  ),
                ],
              ),

              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Padding(padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      imagePaths[index],
                      width: 200,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    );
                  },

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

void onSearch(String query) {
  //code to perform search based on the query
}