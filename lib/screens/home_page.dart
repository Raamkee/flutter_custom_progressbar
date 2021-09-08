import 'package:flutter/material.dart';
import 'package:flutter_custom_progressbar/custom_progressbar/rotate_animation.dart';
import 'package:flutter_custom_progressbar/custom_progressbar/grid_animation.dart';
import 'package:flutter_custom_progressbar/custom_progressbar/flip_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _textButton(screenName, buttonText) {
    return TextButton(
        onPressed: () {
          navigateTo(context, screenName);
        },
        child: Text(buttonText));
  }

  navigateTo(context, screenName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screenName),
    );
  }
}
