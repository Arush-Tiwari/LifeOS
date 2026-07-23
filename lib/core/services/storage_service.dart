import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static late Box<dynamic> _mainBox;
  static late Box<dynamic> _secureBox;

  static Future<void> initialize() async {
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);

    _mainBox = await Hive.openBox('lifeos_main');
    _secureBox = await Hive.openBox('lifeos_secure');
  }

  static Future<void> saveString(String key, String value, {bool secure = false}) async {
    final box = secure ? _secureBox : _mainBox;
    await box.put(key, value);
  }

  static String? getString(String key, {bool secure = false}) {
    final box = secure ? _secureBox : _mainBox;
    return box.get(key) as String?;
  }

  static Future<void> saveInt(String key, int value, {bool secure = false}) async {
    final box = secure ? _secureBox : _mainBox;
    await box.put(key, value);
  }

  static int? getInt(String key, {bool secure = false}) {
    final box = secure ? _secureBox : _mainBox;
    return box.get(key) as int?;
  }

  static Future<void> saveBool(String key, bool value, {bool secure = false}) async {
    final box = secure ? _secureBox : _mainBox;
    await box.put(key, value);
  }

  static bool? getBool(String key, {bool secure = false}) {
    final box = secure ? _secureBox : _mainBox;
    return box.get(key) as bool?;
  }

  static Future<void> delete(String key, {bool secure = false}) async {
    final box = secure ? _secureBox : _mainBox;
    await box.delete(key);
  }

  static Future<void> clear({bool secure = false}) async {
    final box = secure ? _secureBox : _mainBox;
    await box.clear();
  }
}
