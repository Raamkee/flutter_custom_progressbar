import 'package:flutter/material.dart';
import 'package:flutter_custom_progressbar/custom_animations/hand_animation.dart';
import 'package:flutter_custom_progressbar/custom_progressbar/rotate_animation.dart';
import 'package:flutter_custom_progressbar/custom_progressbar/grid_animation.dart';
import 'package:flutter_custom_progressbar/custom_progressbar/flip_animation.dart';
import 'package:flutter_custom_progressbar/paint_objects/paint_animate_polygon.dart';
import 'package:flutter_custom_progressbar/services/navigation_services.dart';
import 'package:flutter_custom_progressbar/utils/string_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textButton(LoadingBouncingGrid(), 'Grid'),
              Divider(color: Colors.white),
              _textButton(LoadingDoubleFlipping(), 'Flip'),
              Divider(color: Colors.white),
              _textButton(LoadingFilling(), 'Rotate'),
              Divider(color: Colors.white),
              _textButton(HandAnimation(), 'Hand Animation'),
              Divider(color: Colors.white),
              _textButton(PaintAnimatePolygon(), 'Paint Polygon Shape'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textButton(screenName, buttonText) {
    return TextButton(
        onPressed: () {
          NavigationServices.navigateToScreen(context, screenName,
              StringConstants.TRANSITION_RIGHTTOLEFT_WITHFADE);
        },
        child: Text(buttonText));
  }
}
