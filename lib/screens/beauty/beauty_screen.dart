import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/components/custom_app_bar.dart';
import 'package:mybeauty/components/jumbotron.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/models/category.dart';
import 'package:mybeauty/screens/bookings/appointment_screen.dart';

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
                child: const Text(
                  'Browse treatments',
                  style: TextStyle(fontSize: 20.0),
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
                        style: const TextStyle(
                            color: greenColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('50'),
                        IconButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppointmentScreen(
                                          title: product.title,
                                        ))),
                            icon: SvgPicture.asset(
                                'assets/icons/plus-circle.svg'))
                      ],
                    ),
                    const Divider(
                      height: 1,
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ));
  }
}
