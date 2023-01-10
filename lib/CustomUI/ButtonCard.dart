// import 'package:chat_dev_stack/Model/ChatModel.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
    required this.name,
    required this.icon,
  });
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.lightGreen[500],
        radius: 23,
        child: Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
