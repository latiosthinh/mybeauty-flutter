import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/coustom_bottom_nav_bar.dart';
import 'package:mybeauty/components/custom_app_bar.dart';
import 'package:mybeauty/components/jumbotron.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';
import 'package:mybeauty/models/category.dart';
import 'package:mybeauty/screens/bookings/order_screen.dart';

class BeautyScreen extends StatefulWidget {
  static String routeName = "/beauty";
  const BeautyScreen({Key? key}) : super(key: key);

  @override
  State<BeautyScreen> createState() => _BeautyScreenState();
}

class _BeautyScreenState extends State<BeautyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarFullNavBar(
        logo: 'MY BEAUTY',
        color: greenColor,
        inputColor: lightGreenColor,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            jumbotron(lightGreenOpacityColor),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                'Browse treatments',
                style: GoogleFonts.robotoCondensed(fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemBuilder: (c, index) => buildCategory(index, context),
                itemCount: beautyCategories.length,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.myBeauty),
    );
  }
}

Widget buildCategory(int i, BuildContext context) {
  return ExpansionTile(
    trailing: const SizedBox.shrink(),
    tilePadding: const EdgeInsets.only(left: 20),
    title: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                  image: AssetImage('assets/images/threading.png'),
                  fit: BoxFit.cover)),
          padding: const EdgeInsets.all(25.0),
          margin: const EdgeInsets.only(bottom: 20.0),
          child: Center(
            child: TextButton(
              onPressed: () => {},
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: greenColor,
                  primary: blackColor,
                  padding: const EdgeInsets.all(10.0)),
              child: Text(
                beautyCategories[i].name,
                style: GoogleFonts.robotoCondensed(
                    fontSize: 20.0,
                    color: whiteColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        )),
    children: [
      SizedBox(
        height: 300,
        child: ListView.builder(
          itemBuilder: ((c, index) =>
              buildProduct(index, beautyCategories[i].products, context)),
          itemCount: beautyCategories[i].products.length,
        ),
      )
    ],
  );
}

Widget buildProduct(int i, List<Product> products, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(defaultPadding),
    color: lightColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          products[i].title,
          style: GoogleFonts.robotoCondensed(
              color: greenColor, fontWeight: FontWeight.w700, fontSize: 16.0),
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: TextFormField(),
              ),
              ClipOval(
                child: Material(
                  color: lightGreenColor,
                  child: InkWell(
                    onTap: () =>
                        {Navigator.pushNamed(context, OrderScreen.routeName)},
                    child: const SizedBox(
                      height: 26,
                      width: 26,
                      child: Icon(
                        Icons.add,
                        size: 16,
                        color: greenColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
