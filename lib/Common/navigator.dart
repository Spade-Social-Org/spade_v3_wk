import 'package:spade_v4/Common/size_config/size_config.dart';
import 'package:flutter/material.dart';

void navigatePop() => Navigator.of(kNavigatorKey.currentContext!).pop();

void navigateAndRemove(
  String routeName, {
  Object? arguments,
}) {
  Navigator.of(kNavigatorKey.currentContext!).pushNamedAndRemoveUntil(
    routeName,
    arguments: arguments,
    (route) => false,
  );
}

Future<dynamic> navigateTo(
  String routeName, {
  Object? arguments,
}) =>
    Navigator.of(kNavigatorKey.currentContext!).pushNamed(
      routeName,
      arguments: arguments,
    );

void navigateAndReplace(
  String routeName, {
  Object? arguments,
}) =>
    Navigator.of(kNavigatorKey.currentContext!).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
