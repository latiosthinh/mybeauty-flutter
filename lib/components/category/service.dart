import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/models/index.dart';
import 'package:mybeauty/screens/index.dart';
import 'package:mybeauty/widgets/index.dart';

class ServiceComponent extends StatefulWidget {
  final List<ServiceModel> services;
  final Color color;
  final bool isExpanded;

  const ServiceComponent(
      {Key? key,
      required this.services,
      required this.color,
      required this.isExpanded})
      : super(key: key);

  @override
  State<ServiceComponent> createState() => _ServiceComponentState();
}

class _ServiceComponentState extends State<ServiceComponent>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.isExpanded
        ? Future.delayed(const Duration(milliseconds: 250), () {
            _controller.forward();
          })
        : _controller.reverse();

    return SizeTransition(
        sizeFactor: _animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: !widget.isExpanded
            ? null
            : Container(
                color: lightColor,
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.only(
                    top: 21, left: 25, bottom: 25, right: 25),
                child: SizedBox(
                  child: Column(
                    children: widget.services.map((service) {
                      return InkWell(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(service.name,
                                style: TextStyle(
                                    color: widget.color,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0)),
                            Text(
                              service.description,
                              style: const TextStyle(fontSize: 10.0),
                            ),
                            const VSpacer(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  service.price,
                                  style: TextStyle(
                                      color: widget.color, fontSize: 16.0),
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
                                      service: service,
                                      color: widget.color,
                                    ))),
                      );
                    }).toList(),
                  ),
                )));
  }
}
