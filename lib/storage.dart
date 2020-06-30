import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage extends ChangeNotifier {
  FlutterSecureStorage _storage = FlutterSecureStorage();

  String _name;
  String get name => _name;
  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String _email;
  String get email => _email;

  String _uid;
  String get uid => _uid;

  Future<void> readData() async {
    var _data = await _storage.readAll();
    _name = _data['NAME'];
    _email = _data['EMAIL'];
    _uid = _data['UID'];
    notifyListeners();
  }

  Future<void> storeData({String name, String email, String uid}) async {
    if (name != null) {
      await _storage.write(key: 'NAME', value: name);
      _name = name;
    } else if (email != null) {
      await _storage.write(key: 'EMAIL', value: email);
      _email = email;
    } else if (uid != null) {
      await _storage.write(key: 'UID', value: uid);
      _uid = uid;
    }
    notifyListeners();
  }
}
