import 'dart:math';
import 'package:flutter/material.dart';

class LoadingDoubleFlipping extends StatefulWidget {
  @override
  _LoadingDoubleFlippingState createState() => _LoadingDoubleFlippingState();
}

class _LoadingDoubleFlippingState extends State<LoadingDoubleFlipping>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;
  Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation1 = Tween(begin: 0.0, end: pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    )..addListener(() => setState(() {}));

    _animation2 = Tween(begin: 0.0, end: pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    )..addListener(() => setState(() {}));

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, 0.005)
      ..rotateX(_animation1.value)
      ..rotateY(_animation2.value);
    return Scaffold(
      body: Center(
        child: Transform(
          transform: transform,
          alignment: FractionalOffset.center,
          child: SizedBox.fromSize(
            size: Size.square(10.0),
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
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange,
        border: Border.all(
          color: Colors.blueGrey,
          width: 60,
          style: BorderStyle.solid,
        ),
      ),
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
