import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/data/index.dart';
import 'package:mybeauty/models/setting.dart';
import 'package:mybeauty/screens/setting/content_perference_screen.dart';
import 'package:mybeauty/screens/setting/country_screen.dart';
import 'package:mybeauty/components/primary_button.dart';
import 'package:mybeauty/screens/login/login_screen.dart';
import 'package:mybeauty/screens/setting/term_screen.dart';
import 'package:mybeauty/services/auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mybeauty/widgets/index.dart';

class SettingScreen extends StatefulWidget {
  static String routeName = "/setting";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final LocalDataStorage _db = LocalDataStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.settings ?? 'Settings'),
          bottom: PreferredSize(
            preferredSize: const Size.square(0),
            child: Container(
              color: pinkColor,
              height: 1.0,
            ),
          )),
      body: Container(
          padding:
              const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) => buildSettingMenu(index),
                    itemCount: menuSettings.length),
              ),
              PrimaryButton(
                  icon: Icons.logout,
                  background: blackColor,
                  color: whiteColor,
                  text: 'Sign out',
                  func: () async => {
                        await AuthService().signOut(),
                        Navigator.pushNamed(context, LoginScreen.routeName)
                      }),
            ],
          )),
    );
  }

  Widget buildSettingMenu(int i) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        height: 50,
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(menuSettings[i].icon),
                  onPressed: () {},
                ),
                const HSpacer(10),
                Text(
                  menuSettings[i].title,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            Visibility(
              visible: menuSettings[i].hasChild,
              child: Row(
                children: [
                  Visibility(
                      visible: menuSettings[i].key == 'country' ||
                          menuSettings[i].key == 'content-preference',
                      child: Text(
                        menuSettings[i].key == 'country'
                            ? _db.getActiveLanguage().name
                            : _db.getActiveContent().id,
                        style:
                            const TextStyle(color: orangeColor, fontSize: 18.0),
                      )),
                  IconButton(
                      onPressed: () => onTap(menuSettings[i].key),
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: grayColor,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onTap(String key) {
    switch (key) {
      case 'country':
        Navigator.pushNamed(context, CountryScreen.routeName);
        break;
      case 'legal':
        Navigator.pushNamed(context, TermScreen.routeName);
        break;
      case 'content-preference':
        Navigator.pushNamed(context, ContentPreferenceScreen.routeName);
        break;
      default:
    }
  }
}
