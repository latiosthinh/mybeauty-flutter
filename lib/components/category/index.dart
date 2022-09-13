import 'package:flutter/material.dart';
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
    return Container(
      padding: const EdgeInsets.all(16),
      child: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _menus[index].isExpanded = !isExpanded;
        });
      },
      children: _menus.map<ExpansionPanel>((MenuModel item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.name),
            );
          },
          body: Container(
            alignment: Alignment.centerLeft,
            child: _buildChild(item.services),
          ),
          isExpanded: item.isExpanded,
        );
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
