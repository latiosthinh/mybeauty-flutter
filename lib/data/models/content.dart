import 'package:hive_flutter/adapters.dart';

part 'content.g.dart';

@HiveType(typeId: 2)
class ContentHive extends HiveObject {
  static const String boxKey = 'content';

  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;
}
