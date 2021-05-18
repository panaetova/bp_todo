import 'package:flutter/material.dart';

class DateInTaskWidget extends StatelessWidget {
  final String dateTimeString;

  const DateInTaskWidget({Key key, @required this.dateTimeString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(dateTimeString, style: TextStyle(color: Colors.redAccent),);
  }


}
