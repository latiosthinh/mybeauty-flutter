import 'package:hive_flutter/hive_flutter.dart';
part 'country.g.dart';

@HiveType(typeId: 1)
class CountryHive extends HiveObject {
  static const String boxKey = 'country';

  @HiveField(0)
  final String code;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String flag;

  @HiveField(3)
  final bool active;

  CountryHive(this.code, this.name, this.flag, this.active);
}
