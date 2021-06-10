import 'package:bp_todo/domain/day-data.dart';
import 'package:bp_todo/domain/day.dart';
import 'package:bp_todo/widgets/day-calendar-body.dart';
import 'package:bp_todo/widgets/task-body.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class InboxCalendarHome extends StatefulWidget {
  @override
  _InboxCalendarHomeState createState() => _InboxCalendarHomeState();
}

class _InboxCalendarHomeState extends State<InboxCalendarHome> {
  String filterType = "inbox";
  DateTime today = new DateTime.now();
  Day dayShow;
  List<String> monthNames = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];
  CalendarController controller = new CalendarController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DayData>(builder: (context, dayData, child) {
      List days = dayData.days;
      return Column(
        children: <Widget>[
          Container(
            height: 60,
            color: Color(0xFF55a3d6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        changeFilter("inbox");
                      },
                      child: Text("Inbox",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 4,
                      width: 120,
                      color: (filterType == "inbox")
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        changeFilter("calendar");
                      },
                      child: Text("Calendar",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 4,
                      width: 120,
                      color: (filterType == "calendar")
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ],
                ),
              ],
            ),
          ),
          (filterType == "calendar")
              ? Column(
                children: [
                  TableCalendar(
                      calendarController: controller,
                      onDaySelected: (day, events, dynamics) {
                        String dayString = DateFormat.MMMMd('en_US').format(day);
                        for (final Day dayInData in days) {
                          if (dayString == dayInData.date) {
                            setState(() {
                              dayShow = dayInData;
                            });
                          } else {
                            setState(() {
                              dayShow = null;
                            });
                          }
                        }
                      },
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      initialCalendarFormat: CalendarFormat.week,
                    ),
                  (dayShow != null)
                      ? DayCalendarBody(day: dayShow)
                      : Container(),
                  ],
              )
              : Container(),
          (filterType == "inbox")
              ? Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Today ${monthNames[today.month - 1]}, ${today.day}/${today.year}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        )),
                    TaskBody(),
                  ],
                )))
              : Container(),
        ],
      );
    });
  }

  void changeFilter(String filter) {
    setState(() {
      filterType = filter;
      dayShow = dayShow;
    });
  }
}
