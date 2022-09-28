import 'package:flutter/material.dart';
import 'package:mybeauty/services/services.dart';

class Avatar extends StatefulWidget {
  final String image;
  final String name;
  const Avatar({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final FireStore _fireStore = FireStore();
  String avatar = 'https://placehold.jp/3d4070/ffffff/100x100.png?text=loading';

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    if (widget.image.isNotEmpty) {
      final file = await _fireStore.getAvatar(widget.image);
      setState(() {
        avatar = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.image.isNotEmpty
        ? CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(avatar),
          )
        : CircleAvatar(
            radius: 50,
            child: Text(widget.name.substring(0, 1)),
          );
  }
}
