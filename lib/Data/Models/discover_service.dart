import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final discoverService = ChangeNotifierProvider((ref) => DiscoverService());

class DiscoverService extends ChangeNotifier {
  String _selectedIndex = 'all';

  String get selectedIndex => _selectedIndex;

  void updateIndex(String newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}
