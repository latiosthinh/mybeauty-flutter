import 'package:hive_flutter/adapters.dart';
import 'package:mybeauty/models/setting.dart';
import 'models/index.dart';

class LocalDataStorage {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<CountryHive>(CountryHiveAdapter());

    await Hive.openBox<CountryHive>(CountryHive.boxKey);
  }

  Future<void> setActiveLanguage(CountryHive country) async {
    final countryBox = Hive.box<CountryHive>(CountryHive.boxKey);
    countryBox.put('activeLanguage', country);
  }

  CountryHive? getActiveLanguage() {
    final countryBox = Hive.box<CountryHive>(CountryHive.boxKey);
    final defaultValue = CountryHive();
    final first = listCountry.first;
    defaultValue.active = true;
    defaultValue.code = first.code;
    defaultValue.flag = first.icon;
    defaultValue.name = first.name;
    return countryBox.get('activeLanguage', defaultValue: defaultValue);
  }
}
