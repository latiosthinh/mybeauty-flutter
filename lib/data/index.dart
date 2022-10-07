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

  static List<CountryHive> initLanguage() {
    final returnValue = <CountryHive>[];
    returnValue
        .add(CountryHive('uk', 'United Kingdom', 'assets/icons/uk.png', true));
    returnValue.add(CountryHive('ru', 'Russia', 'assets/icons/ru.png', false));
    returnValue.add(CountryHive('sp', 'Spain', 'assets/icons/sp.png', false));
    returnValue.add(CountryHive('be', 'Belgium', 'assets/icons/be.png', false));
    returnValue.add(CountryHive('it', 'Italy', 'assets/icons/it.png', false));
    returnValue.add(CountryHive('ca', 'Canada', 'assets/icons/ca.png', false));
    return returnValue;
  }

  Future<void> setActiveLanguage(CountryHive country) async {
    final languageBox = Hive.box<CountryHive>(CountryHive.boxKey);
    languageBox.put('activeLanguage', country);
  }

  CountryHive getActiveLanguage() {
    final countryBox = Hive.box<CountryHive>(CountryHive.boxKey);
    final defaultValue = initLanguage().first;
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
