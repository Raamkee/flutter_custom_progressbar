import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HandAnimation extends StatefulWidget {
  const HandAnimation({Key key}) : super(key: key);

  @override
  _HandAnimationState createState() => _HandAnimationState();
}

class _HandAnimationState extends State<HandAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        padding: EdgeInsets.only(bottom: 45.0),
        child: SizedBox(
          child: RiveAnimation.network(
            'https://public.rive.app/community/runtime-files/922-1809-hand-tapping.riv',
          ),
        ),
      ),
    );
  }
}
