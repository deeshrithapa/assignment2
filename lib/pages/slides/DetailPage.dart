/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class detailpage extends StatefulWidget {
  const detailpage({super.key});

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(30),
              child: Text("Skin Sync"),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.9,
              ),
              items: [
                'lib/images/cetaphil.png',
                'lib/images/cerave1.png',
                'lib/images/derma.png',
                'lib/images/mamaearth.png',
                // Add more images as needed
              ].map((item) => Image.asset(item, fit: BoxFit.cover)).toList(),
            ),
      ],
        ),
      ),
    );
  }
}
*/
