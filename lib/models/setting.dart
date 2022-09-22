class Setting {
  final String icon;
  final String title;
  final bool hasChild;
  final String key;

  Setting(this.hasChild,
      {required this.icon, required this.title, required this.key});
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
      title: 'Feedback and support',
      key: 'feedback-support'),
  Setting(true, icon: 'assets/icons/legal.svg', title: 'Legal', key: 'legal'),
  Setting(true,
      icon: 'assets/icons/country.svg', title: 'Country', key: 'country'),
  Setting(true,
      icon: 'assets/icons/users.svg',
      title: 'Content preference',
      key: 'content-preference')
];

List<Country> listCountry = [
  Country('assets/icons/uk.png', 'United Kingdom', true),
  Country('assets/icons/ru.png', 'Russia', false),
  Country('assets/icons/sp.png', 'Spain', false),
  Country('assets/icons/be.png', 'Belgium', false),
  Country('assets/icons/it.png', 'Italy', false),
  Country('assets/icons/ca.png', 'Canada', false)
];

List<String> listTerm = [
  'Booking Term and Conditions',
  'MyNail’s Term and Policies',
  'Privacy and Cookie Policy',
  'MyNails & Partner Terms of Business',
  'User Generated Content Policy'
];

List<String> listContentPreference = [
  'Show men’s treatments',
  'Show women’s treatments',
  'Show all treatments'
];
