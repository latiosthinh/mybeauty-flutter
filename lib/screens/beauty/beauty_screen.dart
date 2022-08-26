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
      body: SingleChildScrollView(
        child: Container(
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
              Container(
                child: _buildPanel(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.myBeauty),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          beautyCategories[index].isExpanded = !isExpanded;
        });
      },
      children: beautyCategories.map<ExpansionPanel>((Category item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.name),
            );
          },
          body: Container(
            alignment: Alignment.centerLeft,
            child: _buildChild(item.products),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  Widget _buildChild(List<Product> products) {
    return Container(
        color: lightColor,
        padding:
            const EdgeInsets.only(top: 21, left: 25, bottom: 25, right: 25),
        child: SizedBox(
          child: Column(
            children: products.map((product) {
              return SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,
                        style: GoogleFonts.robotoCondensed(
                            color: greenColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0)),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                              child: TextFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          )),
                          ClipOval(
                            child: Material(
                              color: lightGreenColor,
                              child: InkWell(
                                onTap: () => {
                                  Navigator.pushNamed(
                                      context, OrderScreen.routeName)
                                },
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
                    ),
                    SizedBox(
                      height: 7.0,
                      child: Container(
                        color: grayColor,
                        margin: const EdgeInsets.only(bottom: 5.0),
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ));
  }
}
