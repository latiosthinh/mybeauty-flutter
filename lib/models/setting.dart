class Setting {
  final String icon;
  final String title;
  Setting({required this.icon, required this.title});
}

List<Setting> menuSettings = [
  Setting(
      icon: 'assets/icons/exclamation-circle.svg',
      title: 'Feedback and support'),
  Setting(icon: 'assets/icons/legal.svg', title: 'Legal'),
  Setting(icon: 'assets/icons/country.svg', title: 'Country'),
  Setting(icon: 'assets/icons/users.svg', title: 'Content preference')
];
