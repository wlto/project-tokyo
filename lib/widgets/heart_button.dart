import 'package:flutter/material.dart';

class HeartButton extends StatelessWidget {
  final bool currentPhotoIsSaved;
  final VoidCallback onHeartTap;

  HeartButton({this.currentPhotoIsSaved, this.onHeartTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        color: currentPhotoIsSaved ? const Color(0xffde728c) : const Color(0xff898989),
        icon: 
          currentPhotoIsSaved
          ? ImageIcon(AssetImage('assets/icons/heart/heart.png'))
          : ImageIcon(AssetImage('assets/icons/heart-outline/heart-outline.png')),
        onPressed: this.onHeartTap,
      ),
    );
  }
}
