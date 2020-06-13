import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback onRefreshTap;

  RefreshButton({this.onRefreshTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onRefreshTap();
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: 29,
          right: 29,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffdedede),
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(-6.0, -6.0),
              color: const Color(0x85ffffff),
              spreadRadius: 0,
              blurRadius: 16
            ),
            BoxShadow(
              offset: Offset(6.0, 6.0),
              color: const Color(0x1f000000),
              spreadRadius: 0,
              blurRadius: 16
            ),
          ],
        ),
        child: Text('REFRESH')
      )
    );
  }
}