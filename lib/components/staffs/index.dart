import 'package:flutter/material.dart';
import 'package:mybeauty/components/index.dart';
import 'package:mybeauty/models/staff.dart';
import 'package:mybeauty/services/services.dart';
import 'package:mybeauty/widgets/spacer.dart';

class StaffList extends StatefulWidget {
  final Function onSelected;

  const StaffList({Key? key, required this.onSelected}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  final StaffService _staffService = StaffService();
  late Staff selected;
  List<Staff> _staffs = [];

  _setupStaffs() async {
    List<Staff> staffs = await _staffService.getStaffs();
    setState(() {
      _staffs = staffs;
      if (staffs.isNotEmpty) {
        widget.onSelected(staffs.first);
        selected = staffs.first;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _setupStaffs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, left: 16.0, right: 16.0),
      child: Row(
        children: _staffs
            .map((staff) => Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Avatar(
                        image: staff.avatar,
                        name: staff.name,
                      ),
                      const VSpacer(5),
                      Text(staff.name),
                      const VSpacer(5),
                      Row(children: [
                        const HSpacer(2),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16.0,
                        ),
                        Text(
                          staff.rate.toString(),
                          style: const TextStyle(color: Colors.amber),
                        )
                      ]),
                      Radio(
                          value: staff,
                          groupValue: selected,
                          onChanged: ((Staff? value) => {
                                widget.onSelected(value),
                                setState(
                                    () => {selected = value ?? _staffs.first})
                              }))
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
