import 'package:flutter/material.dart';
import 'package:mybeauty/models/category.dart';

class ServiceListComponent extends StatefulWidget {
  const ServiceListComponent({Key? key}) : super(key: key);

  @override
  State<ServiceListComponent> createState() => _ServiceListComponentState();
}

class _ServiceListComponentState extends State<ServiceListComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _buildPanel()),
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
          body: ListTile(
              title: Text(item.name),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  beautyCategories.removeWhere(
                      (Category currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
