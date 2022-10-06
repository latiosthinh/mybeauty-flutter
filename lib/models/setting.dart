class Setting {
  final String icon;
  final String title;
  final bool hasChild;
  final String key;

  Setting(this.hasChild,
      {required this.icon, required this.title, required this.key});
}

class Country {
  final String code;
  final String icon;
  final String name;
  final bool selected;

  Country(this.icon, this.name, this.selected, this.code);
}

class ContentPreference {
  final String key;
  final String name;

  ContentPreference(this.key, this.name);
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
  Country('assets/icons/uk.png', 'United Kingdom', true, 'uk'),
  Country('assets/icons/ru.png', 'Russia', false, 'ru'),
  Country('assets/icons/sp.png', 'Spain', false, 'sp'),
  Country('assets/icons/be.png', 'Belgium', false, 'be'),
  Country('assets/icons/it.png', 'Italy', false, 'it'),
  Country('assets/icons/ca.png', 'Canada', false, 'ca')
];

List<String> listTerm = [
  'Booking Term and Conditions',
  'MyNail’s Term and Policies',
  'Privacy and Cookie Policy',
  'MyNails & Partner Terms of Business',
  'User Generated Content Policy'
];

List<ContentPreference> listContentPreference = [
  ContentPreference('all', 'Show all treatments'),
  ContentPreference('women', 'Show women’s treatments'),
  ContentPreference('men', 'Show men’s treatments'),
];
