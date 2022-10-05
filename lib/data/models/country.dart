import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class CountryHive extends HiveObject {
  static const String boxKey = 'country';

  @HiveField(0)
  late String name;

  @HiveField(1)
  late String flag;

  @HiveField(2)
  late bool active;
}
