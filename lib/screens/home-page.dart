import 'package:bp_todo/screens/add-task-screen.dart';
import 'package:bp_todo/widgets/projects-body.dart';
import 'package:bp_todo/widgets/today-calendar-home.dart';
import 'package:flutter/material.dart';
import 'drawer-menu.dart';
import 'add-project-screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          title: Text('Tasks', style: TextStyle(color: Colors.white),),
          elevation: 0,
          backgroundColor: Color(0xFF55a3d6),
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz_outlined),
              color: Colors.white,
              onPressed: () {},
            ),
          ]),
      drawer: DrawerMenu(),
      body: getBody(),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 2.0,
        shape: CircularNotchedRectangle(),
        color: Color(0xFF55a3d6),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: sectionIndex == 0 ? Colors.white : Colors.white38,
                ),
                onPressed: () {
                  onTabTaped(0);
                },
              ),
              IconButton(
                  icon: Icon(
                    Icons.folder,
                    color: sectionIndex == 1 ? Colors.white : Colors.white38,
                  ),
                  onPressed: () {
                    onTabTaped(1);
                  }),
              SizedBox(
                width: 15,
              ),
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: sectionIndex == 2 ? Colors.white : Colors.white38,
                  ),
                  onPressed: () {
                    onTabTaped(2);
                  }),
              IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: sectionIndex == 3 ? Colors.white : Colors.white38,
                  ),
                  onPressed: () {
                    onTabTaped(3);
                  }),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF2c6992),
          splashColor: Color(0xFF4690c1),
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            if (sectionIndex == 0) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => AddTaskScreen(),
              );
            } else if (sectionIndex == 1) {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => NewProjectScreen(),
              );
            }
          }),
    );
  }

  // ignore: missing_return
  Widget getBody() {
    if (sectionIndex == 0) {
      return InboxCalendarHome();
    } else if (sectionIndex == 1)
      return ProjectBody();
  }

  void onTabTaped(int index) {
    setState(() {
      sectionIndex = index;
    });
  }
}
