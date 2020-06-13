import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// Since this widget uses MediaQuery, be sure to wrap it
// inside a MaterialApp widget.

class HeroImageCard extends StatelessWidget {
  final String imageUrl;

  HeroImageCard({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 1.12, // width:height ratio is 1:1.12
      margin: EdgeInsets.only(
        top: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: const Color(0x19000000),
            spreadRadius: 10,
            blurRadius: 20
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        // child: Image(
        //   image: NetworkImage(imageUrl),
        //   fit: BoxFit.cover
        // ),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imageUrl,
          fit: BoxFit.cover
        )
      )
    );
  }
}