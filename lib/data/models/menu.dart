import 'package:hive_flutter/hive_flutter.dart';

part 'menu.g.dart';

@HiveType(typeId: 3)
class MenuHive extends HiveObject {
  static const String boxKey = 'menu';

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final bool active;

  MenuHive(this.id, this.name, this.image, this.active);
}
