import 'package:flutter/material.dart';

class DateInTaskWidget extends StatelessWidget {
  final String dateTimeString;

  const DateInTaskWidget({Key key, @required this.dateTimeString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_today, color: Colors.redAccent, size: 13,),
        SizedBox(width: 3,),
        Text(dateTimeString, style: TextStyle(color: Colors.redAccent, fontSize: 13),),
      ],
    );
  }


}
