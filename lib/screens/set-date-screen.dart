import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SetDateScreen extends StatelessWidget {
  CalendarController controller = new CalendarController();
  DateTime now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime tomorrow = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  DateTime nextWeek = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 7);

  final Function(String) receiveData;

  SetDateScreen({Key key, this.receiveData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF737373),
        height: 600,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
               Row(
                 children: [
                   IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.of(context).pop()),
                   Text("SCHEDULE"),
                 ],
               ),
                Divider(),
                InkWell(
                  onTap: () {
                    String tomorrowString = DateFormat.MMMMd('en_US').format(tomorrow);
                    receiveData(tomorrowString);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.wb_sunny_outlined, color: Colors.orange, size: 22,),
                      SizedBox(width: 10),
                      Text("Tomorrow", style: TextStyle(fontSize: 15),),
                      Expanded(child: SizedBox()),
                      Text(DateFormat("EEEE").format(tomorrow), style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    String nextWeekString = DateFormat.MMMMd('en_US').format(nextWeek);
                    receiveData(nextWeekString);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.purple, size: 20,),
                      SizedBox(width: 13),
                      Text("Nex Week", style: TextStyle(fontSize: 15),),
                      Expanded(child: SizedBox()),
                      Text(DateFormat("EEEE").format(nextWeek), style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () => receiveData("No Date"),
                  child: Row(
                    children: [
                      Icon(Icons.close, color: Colors.grey, size: 22,),
                      SizedBox(width: 11),
                      Text("No Date", style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                Divider(),
                TableCalendar(
                  calendarController: controller,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                initialCalendarFormat: CalendarFormat.month,
                onDaySelected: (DateTime selectDay, events, dynamics) {
                  String selectDayString = DateFormat.MMMMd('en_US').format(selectDay);
                  receiveData(selectDayString);
                },)
              ],
            ),
          ),
        ));
  }
}
