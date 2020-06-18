import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// Custom widgets
import '../animations/animated_heading.dart';
import '../widgets/hero_image_card.dart';
import '../widgets/heart_button.dart';
import '../widgets/refresh_button.dart';
import '../states/app_model.dart';

class Discover extends StatelessWidget {
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
              AnimatedHeading(text: 'Discover Tokyo'),
              GestureDetector(
                onTap: () {
                  launch(app.currentPhoto.link);
                },
                child: HeroImageCard(imageUrl: app.currentPhoto.url)
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 8.0,
                    bottom: 14.0
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: 'by ',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xff898989),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: app.currentPhoto.owner,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )
                        ),
                        TextSpan(
                          text: ' on Unplash',
                        ),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                )
              ),
              HeartButton(
                currentPhotoIsSaved: app.currentPhotoIsSaved(),
                onHeartTap: () {
                  app.savePhoto();
                },
              ),
              Flexible(child: Center(child: RefreshButton(onRefreshTap: () {
                app.updateCurrentPhoto();
              },)))
            ]
          )
        );
      }
    );
  }
}