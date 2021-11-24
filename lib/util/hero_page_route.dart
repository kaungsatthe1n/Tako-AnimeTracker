import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tako/util/constant.dart';

class HeroPageRoute<T> extends PageRoute<T> {
  HeroPageRoute({required this.builder});

  final WidgetBuilder builder;

  @override
  Color? get barrierColor => tkDarkerBlue;

  @override
  bool get opaque => false;

  @override
  String? get barrierLabel => 'Hero Page Route';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}
