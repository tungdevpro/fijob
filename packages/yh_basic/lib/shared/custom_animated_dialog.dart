import 'dart:async';
import 'package:flutter/material.dart';

enum DialogTransitionMode {
  fade,
  slideFromTop,
  slideFromTopFade,
  slideFromBottom,
  slideFromBottomFade,
  slideFromLeft,
  slideFromLeftFade,
  slideFromRight,
  slideFromRightFade,
  scale,
  fadeScale,
  size,
  sizeFade,
  customIn,
  none,
}

Future<dynamic> showAnimatedDialog(
    BuildContext context, {
      bool barrierDismissible = false,
      required WidgetBuilder builder,
      DialogTransitionMode animationType = DialogTransitionMode.fade,
      Curve curve = Curves.linear,
      Duration? duration,
      Alignment alignment = Alignment.center,
      Axis? axis,
      Color? barrierColor,
    }) async {
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return Builder(builder: (BuildContext context) => pageChild);
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: barrierColor ?? Colors.black54,
    transitionDuration: duration ?? const Duration(milliseconds: 400),
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      switch (animationType) {
        case DialogTransitionMode.fade:
          return FadeTransition(opacity: animation, child: child);
        case DialogTransitionMode.slideFromRight:
          return SlideTransition(
              transformHitTests: false,
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).chain(CurveTween(curve: curve)).animate(animation),
              child: child);

        case DialogTransitionMode.slideFromLeft:
          return SlideTransition(
              transformHitTests: false,
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).chain(CurveTween(curve: curve)).animate(animation),
              child: child);

        case DialogTransitionMode.slideFromRightFade:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );

        case DialogTransitionMode.slideFromLeftFade:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );

        case DialogTransitionMode.slideFromTop:
          return SlideTransition(
            transformHitTests: false,
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: child,
          );

        case DialogTransitionMode.slideFromTopFade:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );

        case DialogTransitionMode.slideFromBottom:
          return SlideTransition(
            transformHitTests: false,
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: child,
          );

        case DialogTransitionMode.slideFromBottomFade:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );

        case DialogTransitionMode.scale:
          return ScaleTransition(
            alignment: alignment,
            scale: CurvedAnimation(
              parent: animation,
              curve: Interval(0.00, 0.50, curve: curve),
            ),
            child: child,
          );

        case DialogTransitionMode.fadeScale:
          return ScaleTransition(
            alignment: alignment,
            scale: CurvedAnimation(
              parent: animation,
              curve: Interval(0.00, 0.50, curve: curve),
            ),
            child: FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: curve),
              child: child,
            ),
          );
        case DialogTransitionMode.size:
          return Align(
            alignment: alignment,
            child: SizeTransition(
              sizeFactor: CurvedAnimation(parent: animation, curve: curve),
              axis: axis ?? Axis.vertical,
              child: child,
            ),
          );

        case DialogTransitionMode.sizeFade:
          return Align(
            alignment: alignment,
            child: SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: curve,
                ),
                child: child,
              ),
            ),
          );

        case DialogTransitionMode.none:
          return child;
        case DialogTransitionMode.customIn:
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..translate(
                  0.0,
                  Tween<double>(begin: -50.0, end: 50.0)
                      .animate(CurvedAnimation(
                      curve: const Interval(.1, .5), parent: animation))
                      .value)
            // ..translate(Tween<double>(begin: -100.0, end: 0).animate(CurvedAnimation(curve: const Interval(.1, .5), parent: animation)).value, .0)
              ..scale(
                Tween<double>(begin: .5, end: 1.0)
                    .animate(
                  CurvedAnimation(
                      curve: const Interval(.5, .9), parent: animation),
                )
                    .value,
              ),
            child: child,
          );
        default:
          return FadeTransition(opacity: animation, child: child);
      }
    },
  );
}