import 'dart:math';
import 'package:flutter/material.dart';

class LoadingFilling extends StatefulWidget {
  @override
  _LoadingFillingState createState() => _LoadingFillingState();
}

class _LoadingFillingState extends State<LoadingFilling>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;
  Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    _animation1 = CurveTween(curve: Curves.ease).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0),
      ),
    )..addListener(() => setState(() {}));

    _animation2 = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 1.0, curve: Curves.linear)),
    )..addListener(() => setState(() {}));

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final Matrix4 transform = Matrix4.rotationZ(_animation1.value * pi * 2.0);

    return Scaffold(
      body: Center(
        child: Transform(
          transform: transform,
          alignment: Alignment.center,
          child: SizedBox.fromSize(
            size: Size.square(20.0),
            child: _itemBuilder(0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {
          closeScreen();
        },
      ),
    );
  }

  Widget _itemBuilder(int index) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Positioned(
          height: (1 - _animation2.value.abs()) * 20,
          width: 10,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
            border: Border.all(
              color: Colors.blue,
              width: 50,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  closeScreen() {
    Navigator.of(context).pop();
  }
}
