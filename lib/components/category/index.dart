import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mybeauty/components/index.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/screens/bookings/appointment_screen.dart';
import 'package:mybeauty/services/menu_service.dart';
import 'package:mybeauty/services/models.dart';
import 'package:mybeauty/widgets/index.dart';

class CategoryComponent extends StatefulWidget {
  final Color color;
  final int type;

  const CategoryComponent({Key? key, required this.color, required this.type})
      : super(key: key);

  @override
  State<CategoryComponent> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent>
    with TickerProviderStateMixin {
  final MenuService _menuService = MenuService();
  late AnimationController _controller;
  late Animation<double> _animation;

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

    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    _setupMenu();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        return Column(mainAxisSize: MainAxisSize.max, children: [
          InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: item.isExpanded ? 350 : 250,
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
                            image: AssetImage(item.image), fit: BoxFit.cover)),
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
                  item.isExpanded
                      ? Future.delayed(const Duration(milliseconds: 250), () {
                          _controller.forward();
                        })
                      : _controller.reverse()
                },
              )
            },
          ),
          Container(
            padding: item.isExpanded
                ? null
                : const EdgeInsets.only(bottom: 16.0),
            
          ),
          SizeTransition(
              sizeFactor: _animation,
              axis: Axis.vertical,
              axisAlignment: -1,
              child: item.isExpanded ? _buildChild(item.services) : null),
        ]);
      }).toList(),
    );
  }

  Widget _buildChild(List<ServiceModel> products) {
    return Container(
        color: lightColor,
        margin: const EdgeInsets.only(bottom: 16.0),
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
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                    const VSpacer(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          product.price,
                          style: TextStyle(color: widget.color, fontSize: 16.0),
                        ),
                        Icon(
                          Icons.add_circle,
                          color: widget.color,
                        )
                      ],
                    ),
                    const Divider(
                      height: 2,
                    ),
                    const VSpacer(5)
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
