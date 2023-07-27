import 'package:flutter/widgets.dart';

// KNavigatorKey is for devices with navigation button at the buttom
final kNavigatorKey = GlobalKey<NavigatorState>();

// with deviceProperties, you will get both the width and height of devices with buttom navigation button and devices without it
final _deviceProperties = MediaQuery.of(kNavigatorKey.currentContext!);

final kScreenHeight = _deviceProperties.size.height -
    _deviceProperties.padding.top -
    _deviceProperties.padding.bottom -
    _deviceProperties.systemGestureInsets.bottom;

final kScreenWidth = _deviceProperties.size.width -
    _deviceProperties.padding.left -
    _deviceProperties.padding.right;

const kDesignHeight = 926;
const kDesignWidth = 428;
