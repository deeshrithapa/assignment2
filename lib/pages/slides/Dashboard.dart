  import 'package:flutter/material.dart';

  class dashpage extends StatefulWidget {
    const dashpage({super.key});

    @override
    State<dashpage> createState() => _dashpageState();
  }

  class _dashpageState extends State<dashpage> {
    List<String> images = [
       'assets/images/AdvancedSnail.png' ,
       'assets/images/TheDermaCo.png',
       'assets/images/TheOrdinary.png',
      'assets/images/skinsync1.png',

      //"https://i.pinimg.com/564x/c0/8a/34/c08a340c7b6cda7100c8666b8f0c175f.jpg" ,

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
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Text(
                  "Skin Sync",
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
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
                // SizedBox(height: 20), // some space between search bar and image
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset("lib/TheDermaCo.png", height: 150, width: 100,),
                //   ],
                // )

                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          images[index],
                          height: 150,
                          width: 300,
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