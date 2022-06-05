import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class AvatarWidget extends StatelessWidget {
  final String name;
  final _dateTimeNow = DateTime.now().toString();

  AvatarWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeOfAvatar = MediaQuery.of(context).size.width / 30;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        randomAvatar('$name $_dateTimeNow',
            width: sizeOfAvatar, height: sizeOfAvatar),
        Text(name),
      ],
    );
  }
}
