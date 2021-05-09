import 'package:bp_todo/widgets/task-body.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TodayCalendarHome extends StatefulWidget {
  @override
  _TodayCalendarHomeState createState() => _TodayCalendarHomeState();
}

class _TodayCalendarHomeState extends State<TodayCalendarHome> {
  String filterType = "today";
  DateTime today = new DateTime.now();
  List<String> monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
  CalendarController controller = new CalendarController();

  @override
  Widget build(BuildContext context) {
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
                      changeFilter("today");
                    },
                    child: Text("Today",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 4,
                    width: 120,
                    color: (filterType == "today")
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
            ? TableCalendar(
          calendarController: controller,
          onDaySelected: (day, events, dynamics) {
            print(day.toString());
          },
          startingDayOfWeek: StartingDayOfWeek.monday,
          initialCalendarFormat: CalendarFormat.week,)
            : Container(),
        Expanded(
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Today ${monthNames[today.month-1]}, ${today.day}/${today.year}", style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ))
                          ],
                        )
                    ),
                    TaskBody(),
                  ],
                )
            ))
      ],
    );
  }

  void changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }
}
