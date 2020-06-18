import 'package:flutter/material.dart';

class AnimatedHeading extends StatelessWidget {
  final String text;
  static final opacityTween = Tween<double>(begin: 0.0, end: 1.0);

  AnimatedHeading({this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: opacityTween,
      duration: Duration(milliseconds: 320), 
      builder: (BuildContext context, double value, Widget child) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: 24
          ),
          child: Text(
            this.text,
            style: TextStyle(
              color: const Color(0xff000000).withOpacity(value),
              fontSize: 36,
              fontWeight: FontWeight.w700,
            )
          )
        );
      }
    );
  }
}