import 'package:flutter/material.dart';
import 'package:mybeauty/services/services.dart';

class Avatar extends StatefulWidget {
  final String image;
  const Avatar({Key? key, required this.image}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final FireStore _fireStore = FireStore();
  String avatar = 'https://i.pravatar.cc/100';

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
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(avatar),
    );
  }
}
