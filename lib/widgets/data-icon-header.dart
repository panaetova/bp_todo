import 'package:flutter/material.dart';

class DataTaskIconHeader extends StatelessWidget {
  final int iconIndex;
  DataTaskIconHeader({Key key, @required this.iconIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Row(children: [
              Icon(getIcon(), color: Colors.black87),
              SizedBox(
                width: 10,
              ),
              Text(getString(),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
            ])),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Divider(color: Colors.grey, thickness: 0.5, indent: 40),
        ),
      ],
    );
  }

  // ignore: missing_return
  IconData getIcon() {
    if (iconIndex == 0) {
      return Icons.mediation;
    } else if (iconIndex == 1) {
      return Icons.message_outlined;
    } else if (iconIndex == 2) {
      return Icons.label_outline;
    }
  }

  // ignore: missing_return
  String getString() {
    if (iconIndex == 0) {
      return "Sub-Tasks";
    } else if (iconIndex == 1) {
      return "Notes";
    } else if (iconIndex == 2) {
      return "Labels";
    }
  }
}
