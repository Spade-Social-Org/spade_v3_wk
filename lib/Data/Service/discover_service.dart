import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscoverService {
  final SharedPreferences _sharedPrefs;
  final BehaviorSubject<String> _prefsChangeSubject = BehaviorSubject<String>();

  Stream<String> get prefsChangeStream => _prefsChangeSubject.stream;

  DiscoverService(this._sharedPrefs);

  String getString(String key) {
    return _sharedPrefs.getString(key) ?? '';
  }

  Future<void> setString(String key, String value) async {
    await _sharedPrefs.setString(key, value);
    _prefsChangeSubject.add(key);
  }

  void dispose() {
    _prefsChangeSubject.close();
  }
}