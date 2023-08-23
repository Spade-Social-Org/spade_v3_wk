import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DiscoverService extends ChangeNotifier{
  String _selectedIndex = 'all';

  get selectedIndex => _selectedIndex;

  void updateIndex(String newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}