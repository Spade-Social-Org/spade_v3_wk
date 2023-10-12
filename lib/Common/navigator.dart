import 'package:flutter/material.dart';

final kNavigatorKey = GlobalKey<NavigatorState>();

void pop() => Navigator.of(kNavigatorKey.currentContext!).pop();
Future<T?> push<T>(Widget child) => Navigator.of(kNavigatorKey.currentContext!)
    .push(MaterialPageRoute(builder: (ctx) => child));

void navigateAndRemove(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    routeName,
    arguments: arguments,
    (route) => false,
  );
}

Future<dynamic> navigateNamedTo(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) =>
    Navigator.of(context).pushNamed(routeName, arguments: arguments);

void navigateAndReplace(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  Navigator.of(context).pushReplacementNamed(
    routeName,
    arguments: arguments,
  );
}
