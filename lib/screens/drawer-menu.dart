import 'package:bp_todo/screens/add-label-screen.dart';
import 'package:bp_todo/screens/add-project-screen.dart';
import 'package:bp_todo/widgets/drawer-list-of-labels.dart';
import 'package:bp_todo/widgets/drawer-list-of-projects.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth-services.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  bool visibleProjects = false;
  bool visibleLabels = false;

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Menu",
                        style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),),
                    ),
                    Expanded(child: SizedBox()),
                    IconButton(
                        onPressed: () async => await loginProvider.logout(),
                        icon: Icon(Icons.logout, color: Theme.of(context).primaryColor,))
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF55a3d6),
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Icon(Icons.folder, color: Colors.black54,),
                  SizedBox(width: 10,),
                  Text("Project", style: TextStyle(fontSize: 17),),
                  Expanded(child: SizedBox()),
                  IconButton(
                      icon: visibleProjects ?
                      Icon(
                        Icons.keyboard_arrow_down_sharp, color: Colors.black54,)
                          :
                      Icon(Icons.keyboard_arrow_left_sharp,
                        color: Colors.black54,),
                      onPressed: () {
                        setState(() {
                          visibleProjects = !visibleProjects;
                        });
                      }),
                  IconButton(icon: Icon(Icons.add, color: Colors.black54),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => NewProjectScreen(),
                        );
                      }),
                ],
              ),
              Visibility(
                  visible: visibleProjects,
                  child: DrawerListOfProjects(),
              ),
              Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Icon(Icons.label, color: Colors.black54,),
                    SizedBox(width: 10,),
                    Text("Labels", style: TextStyle(fontSize: 17),),
                    Expanded(child: SizedBox()),
                    IconButton(
                        icon: visibleLabels ?
                        Icon(
                          Icons.keyboard_arrow_down_sharp, color: Colors.black54,)
                            :
                        Icon(Icons.keyboard_arrow_left_sharp,
                          color: Colors.black54,),
                        onPressed: () {
                          setState(() {
                            visibleLabels = !visibleLabels;
                          });
                        }),
                    IconButton(
                        icon: Icon(Icons.add, color: Colors.black54),
                        onPressed: () {
                          String newLabel;
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return NewLabelScreen();
                              });
                        }),
                  ]
              ),
              Visibility(
                visible: visibleLabels,
                child: DrawerListOfLabels(),
              ),
            ],
          ),
        );}
}
