class Setting {
  final String icon;
  final String title;
  final bool hasChild;

  Setting(this.hasChild, {required this.icon, required this.title});
}

class Country {
  final String icon;
  final String name;
  final bool selected;

  Country(this.icon, this.name, this.selected);
}

List<Setting> menuSettings = [
  Setting(false,
      icon: 'assets/icons/exclamation-circle.svg',
      title: 'Feedback and support'),
  Setting(true, icon: 'assets/icons/legal.svg', title: 'Legal'),
  Setting(true, icon: 'assets/icons/country.svg', title: 'Country'),
  Setting(true, icon: 'assets/icons/users.svg', title: 'Content preference')
];

List<Country> listCountry = [
  Country('assets/icons/uk.png', 'United Kingdom', true),
  Country('assets/icons/ru.png', 'Russia', false),
  Country('assets/icons/sp.png', 'Spain', false),
  Country('assets/icons/be.png', 'Belgium', false),
  Country('assets/icons/it.png', 'Italy', false),
  Country('assets/icons/ca.png', 'Canada', false)
];
