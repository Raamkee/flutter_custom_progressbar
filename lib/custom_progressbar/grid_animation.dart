import 'package:flutter/material.dart';

class LoadingBouncingGrid extends StatefulWidget {
  @override
  _LoadingBouncingGridState createState() => _LoadingBouncingGridState();
}

class _LoadingBouncingGridState extends State<LoadingBouncingGrid>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1,
      _animation2,
      _animation3,
      _animation4,
      _animation5;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation1 = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _animation2 = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.7, curve: Curves.easeIn),
      ),
    );

    _animation3 = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeIn),
      ),
    );

    _animation4 = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.9, curve: Curves.easeIn),
      ),
    );

    _animation5 = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildShape(_animation3, 0),
                  _buildShape(_animation4, 1),
                  _buildShape(_animation5, 2),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildShape(_animation2, 3),
                  _buildShape(_animation3, 4),
                  _buildShape(_animation4, 5),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildShape(_animation1, 6),
                  _buildShape(_animation2, 7),
                  _buildShape(_animation3, 8),
                ],
              ),
            ],
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

  Widget _buildShape(Animation<double> animation, int index) {
    int invertedOffset = 1;
    return Transform.scale(
      scale: invertedOffset - animation.value.abs(),
      child: _itemBuilder(index),
    );
  }

  Widget _itemBuilder(int index) {
    return SizedBox.fromSize(
      size: Size.square(35),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.orange,
          border: Border.all(
            color: Colors.orange,
            width: 8,
            style: BorderStyle.solid,
          ),
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
