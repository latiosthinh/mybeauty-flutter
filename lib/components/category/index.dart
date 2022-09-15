import 'package:flutter/material.dart';
import 'package:mybeauty/components/grayed_out/index.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/models/category.dart';
import 'package:mybeauty/screens/bookings/appointment_screen.dart';
import 'package:mybeauty/services/menu_service.dart';
import 'package:mybeauty/services/models.dart';

class CategoryComponent extends StatefulWidget {
  final Color color;
  final List<Category> categories;
  final int type;

  const CategoryComponent(
      {Key? key,
      required this.color,
      required this.categories,
      required this.type})
      : super(key: key);

  @override
  State<CategoryComponent> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent> {
  final MenuService _menuService = MenuService();

  List<MenuModel> _menus = [];
  _setupMenu() async {
    List<MenuModel> menus = await _menuService.getMenus(widget.type);
    setState(() {
      _menus = menus;
    });
  }

  @override
  void initState() {
    super.initState();
    _setupMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: _menus.map((MenuModel item) {
        return Column(mainAxisSize: MainAxisSize.max, children: [
          InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: item.isExpanded ? 350 : 250,
              height: 100,
              child: GrayedOut(
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: AssetImage(item.image), fit: BoxFit.cover)),
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: widget.color,
                        child: InkWell(
                          child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(item.name)),
                        ),
                      ),
                    )),
                grayedOut: !item.isExpanded,
              ),
            ),
            onTap: () => {
              setState(
                () => item.isExpanded = !item.isExpanded,
              )
            },
          ),
          item.isExpanded ? _buildChild(item.services) : const SizedBox.shrink()
        ]);
      }).toList(),
    );
  }

  Widget _buildChild(List<ServiceModel> products) {
    return Container(
        color: lightColor,
        padding:
            const EdgeInsets.only(top: 21, left: 25, bottom: 25, right: 25),
        child: SizedBox(
          child: Column(
            children: products.map((product) {
              return InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: TextStyle(
                            color: widget.color,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('50'),
                        Icon(
                          Icons.add_circle,
                          color: widget.color,
                        )
                      ],
                    ),
                    const Divider(
                      height: 1,
                    )
                  ],
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppointmentScreen(
                              service: product,
                              color: widget.color,
                            ))),
              );
            }).toList(),
          ),
        ));
  }
}
