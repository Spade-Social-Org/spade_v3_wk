import 'package:flutter/widgets.dart';

final kNavigatorKey = GlobalKey<NavigatorState>();

final _deviceProperties = MediaQuery.of(kNavigatorKey.currentContext!);

final kScreenHeight = _deviceProperties.size.height -
    _deviceProperties.padding.top -
    _deviceProperties.padding.bottom -
    _deviceProperties.systemGestureInsets.bottom;

final kScreenWidth = _deviceProperties.size.width -
    _deviceProperties.padding.left -
    _deviceProperties.padding.right;

const kDesignHeight = 896;
const kDesignWidth = 414;
