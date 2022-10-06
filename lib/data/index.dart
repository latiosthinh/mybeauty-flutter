import 'package:hive_flutter/adapters.dart';
import 'package:mybeauty/models/setting.dart';
import 'models/index.dart';

class LocalDataStorage {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<CountryHive>(CountryHiveAdapter());
    Hive.registerAdapter<ContentHive>(ContentHiveAdapter());

    await Hive.openBox<CountryHive>(CountryHive.boxKey);
    await Hive.openBox<ContentHive>(ContentHive.boxKey);
  }

  Future<void> setActiveLanguage(CountryHive country) async {
    final languageBox = Hive.box<CountryHive>(CountryHive.boxKey);
    languageBox.put('activeLanguage', country);
  }

  CountryHive getActiveLanguage() {
    final countryBox = Hive.box<CountryHive>(CountryHive.boxKey);
    final defaultValue = CountryHive();
    final first = listCountry.first;
    defaultValue.active = true;
    defaultValue.code = first.code;
    defaultValue.flag = first.icon;
    defaultValue.name = first.name;
    return countryBox.get('activeLanguage', defaultValue: defaultValue) ??
        defaultValue;
  }

  Future<void> setActiveContent(ContentHive content) async {
    final contentBox = Hive.box<ContentHive>(ContentHive.boxKey);
    contentBox.put('activeContent', content);
  }

  ContentHive getActiveContent() {
    final contentBox = Hive.box<ContentHive>(ContentHive.boxKey);
    final defaultValue = ContentHive();
    final first = listContentPreference[0];
    defaultValue.id = first.key;
    defaultValue.name = first.name;
    return contentBox.get('activeContent', defaultValue: defaultValue) ??
        defaultValue;
  }
}
