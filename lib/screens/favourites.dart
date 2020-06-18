import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../states/app_model.dart';
import '../animations/animated_heading.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, app, child) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AnimatedHeading(text: 'Favourites'),
              Expanded(
                child: ListView.builder(
                  itemCount: app.savedPhotos.length,
                  itemBuilder: (context, index) {
                    return _buildPhotoCard(app, context, index);
                  }
                )
              )
            ]
          )
        );
      }
    );
  }

  Widget _buildPhotoCard(app, context, index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 1.12,
      margin: EdgeInsets.only(
        right: 20,
        bottom: 50,
        left: 20
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: const Color(0x32000000),
            spreadRadius: 4,
            blurRadius: 14
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        // child: Image(
        //   image: NetworkImage(imageUrl),
        //   fit: BoxFit.cover
        // ),
        child: Stack(
          children: <Widget>[
            FadeInImage.memoryNetwork(
              width: 550,
              height: 550,
              placeholder: kTransparentImage,
              image: app.savedPhotos[index].url,
              fit: BoxFit.cover
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: ClipRect(
                child: GestureDetector(
                  onTap: () {
                    launch(app.savedPhotos[index].link);
                  },
                  child: Container(
                    width: 550,
                    padding: EdgeInsets.only(
                      top: 24,
                      bottom: 24,
                      left: 20
                    ),
                    color: const Color(0x00000000),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5
                      ),
                      child: Text(
                        app.savedPhotos[index].owner,
                        style: TextStyle(
                          color: const Color(0xffffffff),
                          decoration: TextDecoration.underline
                        ),
                      )
                    ),
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}