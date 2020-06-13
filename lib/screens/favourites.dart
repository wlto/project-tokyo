import 'package:flutter/material.dart';
import '../animations/animated_heading.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedHeading(text: 'Favourites')
        ]
      )
    );
  }
}