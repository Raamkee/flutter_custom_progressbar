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
  List transitionType = [
    'plain',
    'topToBottom',
    'leftToRight',
    'leftToRightWithFade',
    'scale',
    'fade'
  ];

  String tPlain;
  String tTopToBottom;
  String tLeftToRight;
  String tLeftToRightFade;
  String tScale;
  String tFade;
  @override
  void initState() {
    super.initState();

    tPlain = transitionType[0];
    tTopToBottom = transitionType[1];
    tLeftToRight = transitionType[2];
    tLeftToRightFade = transitionType[3];
    tScale = transitionType[4];
    tFade = transitionType[5];
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
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => screenName),
    // );
    Navigator.of(context).push(_createRoute(screenName, tFade));
  }

  Route _createRoute(screenName, String transitionType) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screenName,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transitionType) {
          case 'plain':
            return child;
            break;

          case 'topToBottom':
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
            break;

          case 'fade':
            return FadeTransition(opacity: animation, child: child);
            break;

          case 'scale':
            return ScaleTransition(
              alignment: Alignment.center,
              scale: CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.00,
                  0.50,
                  curve: Curves.linear,
                ),
              ),
              child: child,
            );
            break;

          case 'leftToRightWithFade':
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
              ),
              child: FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              ),
            );
            break;

          case 'leftToRight':
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
            break;

          default:
            return FadeTransition(opacity: animation, child: child);
        }
      },
    );
  }
}
