class Staff {
  final String id;
  final String name;
  final String avatar;
  final double rate;

  Staff(this.name, this.avatar, this.rate, this.id);

  factory Staff.fromJson(Map<String, dynamic>? json, String id) {
    return Staff(json?['name'], json?['avatar'], json?['rate'], id);
  }
}
