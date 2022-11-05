import 'package:flutter/material.dart';
import 'package:mybeauty/components/index.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/services/menu_service.dart';
import 'package:mybeauty/services/models.dart';
import 'package:mybeauty/components/category/service.dart';

class CategoryComponent extends StatefulWidget {
  final Color color;
  final int type;

  const CategoryComponent({Key? key, required this.color, required this.type})
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
      child: Container(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: _buildPanel()),
    );
  }

  Widget _buildPanel() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: _menus.map((MenuModel item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            InkWell(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: item.isExpanded ? 500 : 250,
                curve: Curves.easeOut,
                height: 100,
                child: GrayedOut(
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: item.isExpanded
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0))
                              : BorderRadius.circular(5.0),
                          image: DecorationImage(
                              image: AssetImage(item.image),
                              fit: BoxFit.cover)),
                      child: Center(
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: widget.color,
                          child: InkWell(
                            child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                      color: item.isExpanded
                                          ? whiteColor
                                          : blackColor,
                                      fontSize: 20.0,
                                      fontWeight: item.isExpanded
                                          ? FontWeight.w700
                                          : FontWeight.w400),
                                )),
                          ),
                        ),
                      )),
                  grayedOut: !item.isExpanded,
                ),
              ),
              onTap: () => {
                setState(
                  () => {
                    item.isExpanded = !item.isExpanded,
                  },
                )
              },
            ),
            ServiceComponent(
              services: item.services,
              color: widget.color,
              isExpanded: item.isExpanded)
          ]),
        );
      }).toList(),
    );
  }
}
