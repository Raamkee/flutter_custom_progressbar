import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationServices {
  static Future navigateToScreen(
          BuildContext context, Widget screen, transitionStyle) =>
      Navigator.of(context).push(_createRoute(screen, transitionStyle));

  static Future replaceScreen(
          BuildContext context, Widget screen, transitionStyle) =>
      Navigator.of(context)
          .pushReplacement(_createRoute(screen, transitionStyle));

  static Future<dynamic> close(BuildContext context, dynamic data) async =>
      Navigator.pop(context, data);

  static Route _createRoute(screenName, String transitionType) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 800),
      reverseTransitionDuration: Duration(milliseconds: 800),
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

          case 'rightToLeft':
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
            break;

          case 'rightToLeftWithFade':
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
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
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              ),
            );
            break;

          case 'rightToLeftWithFadeCurved':
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
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
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              ),
            );
            break;

          case 'rotate':
            return new RotationTransition(
              alignment: Alignment.topCenter,
              turns: animation,
              child: ScaleTransition(
                alignment: Alignment.topCenter,
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            );
            break;

          case 'size':
            return Align(
              alignment: Alignment.topCenter,
              child: SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: animation,
                  curve: Curves.bounceOut,
                ),
                child: child,
              ),
            );
            break;

          // case 'rightToLeftJoined':
          //   return Stack(
          //     children: <Widget>[
          //       SlideTransition(
          //         position: Tween<Offset>(
          //           begin: const Offset(0.0, 0.0),
          //           end: const Offset(-1.0, 0.0),
          //         ).animate(
          //           CurvedAnimation(
          //             parent: animation,
          //             curve: Curves.easeInOut,
          //           ),
          //         ),
          //         child: this,
          //       ),
          //       SlideTransition(
          //         position: Tween<Offset>(
          //           begin: const Offset(1.0, 0.0),
          //           end: Offset.zero,
          //         ).animate(
          //           CurvedAnimation(
          //             parent: animation,
          //             curve: Curves.easeInOut,
          //           ),
          //         ),
          //         child: child,
          //       )
          //     ],
          //   );
          //   break;

          default:
            return FadeTransition(opacity: animation, child: child);
        }
      },
    );
  }
}
