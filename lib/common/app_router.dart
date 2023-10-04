import 'package:flutter/material.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?> push<T>(Widget child) =>
      Navigator.of(navigatorKey.currentContext!)
          .push(MaterialPageRoute(builder: (context) => child));

  static Future<T?> pushReplacement<T>(Widget child) =>
      Navigator.of(navigatorKey.currentContext!)
          .pushReplacement(MaterialPageRoute(builder: (context) => child));

  static Future<void> pushAndRemoveUntil(Widget child) =>
      Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => child), (c) => false);

  static Future<T?> pushNamed<T>(String routeName, {Object? args}) =>
      Navigator.of(navigatorKey.currentContext!)
          .pushNamed(routeName, arguments: args);

  static Future<T?> pushNamedAndRemove<T>(
          String routeName, bool Function(Route<dynamic>) c, {Object? args}) =>
      Navigator.of(navigatorKey.currentContext!)
          .pushNamedAndRemoveUntil(routeName, c, arguments: args);

  static void pop<T>() => Navigator.of(navigatorKey.currentContext!).pop();
}
