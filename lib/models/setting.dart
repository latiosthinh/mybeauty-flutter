class Setting {
  final String icon;
  final String title;
  final bool hasChild;
  final String key;

  Setting(this.hasChild,
      {required this.icon, required this.title, required this.key});
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
