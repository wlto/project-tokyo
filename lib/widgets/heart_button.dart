import 'package:flutter/material.dart';

class _HeartButtonState extends State<HeartButton> {
  bool favourited = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        color: favourited ? const Color(0xffde728c) : const Color(0xff898989),
        icon: 
          favourited 
          ? ImageIcon(AssetImage('assets/icons/heart/heart.png'))
          : ImageIcon(AssetImage('assets/icons/heart-outline/heart-outline.png')),
        onPressed: () {
          setState(() {
            favourited = !favourited;
          });
        },
      ),
    );
  }
}

class HeartButton extends StatefulWidget {
  @override
  _HeartButtonState createState() => _HeartButtonState();
}
