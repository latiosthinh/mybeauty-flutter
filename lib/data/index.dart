import 'package:hive_flutter/adapters.dart';
import 'models/index.dart';

class LocalDataStorage {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    await Hive.openBox<CountryHive>(CountryHive.boxKey);
  }
}
