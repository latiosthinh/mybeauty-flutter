class Setting {
  final String icon;
  final String title;
  final bool hasChild;

  Setting(this.hasChild, {required this.icon, required this.title});
}

List<Setting> menuSettings = [
  Setting(false,
      icon: 'assets/icons/exclamation-circle.svg',
      title: 'Feedback and support'),
  Setting(true, icon: 'assets/icons/legal.svg', title: 'Legal'),
  Setting(true, icon: 'assets/icons/country.svg', title: 'Country'),
  Setting(true, icon: 'assets/icons/users.svg', title: 'Content preference')
];
