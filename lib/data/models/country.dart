import 'package:hive_flutter/hive_flutter.dart';
part 'country.g.dart';

@HiveType(typeId: 1)
class CountryHive extends HiveObject {
  static const String boxKey = 'country';

  @HiveField(0)
  late String code;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String flag;

  @HiveField(3)
  late bool active;
}
