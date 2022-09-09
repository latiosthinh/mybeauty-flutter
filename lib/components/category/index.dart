import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/models/category.dart';
import 'package:mybeauty/screens/bookings/appointment_screen.dart';

class CategoryComponent extends StatefulWidget {
  final Color color;
  final List<Category> categories;

  const CategoryComponent(
      {Key? key, required this.color, required this.categories})
      : super(key: key);

  @override
  State<CategoryComponent> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent> {
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
          widget.categories[index].isExpanded = !isExpanded;
        });
      },
      children: widget.categories.map<ExpansionPanel>((Category item) {
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
                        style: TextStyle(
                            color: widget.color,
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
                                          color: widget.color,
                                        ))),
                            icon: Icon(
                              Icons.add_circle,
                              color: widget.color,
                            ))
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
