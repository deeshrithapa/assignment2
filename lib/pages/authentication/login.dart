import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        //padding: const EdgeInsets.only(top: 100, left: 140),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("SkinSync",
                style: TextStyle(
                  fontSize: 40, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold,
                ),),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkovC9a5Je29Pg-DaKoC5fPi8s2JAdD5wNqx1esDO7uEv4r9LFFAl1Xu-IZKZYBRMqBz4&usqp=CAU", height: 200, width: 150,),
              ],
            ),
            Row(
              children: [
                Text("Login Here", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),)
              ],
            ),
            SizedBox(height: 40,),
           
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(right: 35, left: 35),
               child: Column(
                 children: [
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
                   SizedBox(height: 50,),
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
                   SizedBox(height: 20,),

                   Container(
                     height: 50,width: 150,
                     decoration: BoxDecoration(color: Colors.blue.shade200,
                         borderRadius: BorderRadius.circular(30)),
                     child: Center(
                       child: Text("Login".toUpperCase(),
                         style: TextStyle(color: Colors.black,
                             fontSize: 14,fontWeight: FontWeight.bold),),
                     ),
                   ),
                   Row(
                     children: [
                       TextButton(onPressed: (){},
                           child:Text("Forgot Password",
                             style: TextStyle(
                                 decoration: TextDecoration.underline,
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold),),
                       )
                    /*CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.lightBlueAccent,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.arrow_forward),
                      ),
                    )*/
                     ],
                   ),
                 ],
               ),
              ),
            )
          ]
    ),
    ),
    );
  }
}
