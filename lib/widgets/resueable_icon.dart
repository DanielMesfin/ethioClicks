import 'package:flutter/material.dart';

class ReusableIcon extends StatelessWidget {
  final IconData iconData;
  const ReusableIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // backgroundColor: Colors.grey,
      radius: 20,
      child: Icon(
        iconData,
        size: 40,
        color: const Color.fromARGB(255, 17, 72, 40),
      ),
    );
  }
}
