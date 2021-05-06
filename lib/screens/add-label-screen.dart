import 'package:bp_todo/domain/label-data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewLabelScreen extends StatefulWidget {
  @override
  _NewLabelScreenState createState() => _NewLabelScreenState();
}

class _NewLabelScreenState extends State<NewLabelScreen> {
  String newLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF737373),
        height: 150,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.0),
            child:
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context)
                          .size
                          .width -
                          65,
                      child: TextField(
                        style:
                        TextStyle(fontSize: 20.0),
                        cursorHeight: 20.0,
                        onChanged: (value) {
                          newLabel = value;
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            if(newLabel!= null) {
                              Provider.of<LabelData>(context, listen: false).addLabel(newLabel);
                              Navigator.of(context).pop();
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),
                ListTile(
                    leading: Icon(Icons.palette_outlined, color: Colors.grey,),
                    title: Text("Color"),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    onTap: () {
                      return showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Select Color"),
                              IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  })
                            ],
                          ),
                          content: Wrap(

                          ),
                          actions: [
                            TextButton(onPressed: () =>
                                Navigator.of(context)
                                    .pop(),
                                child: Text("Close"))
                          ],
                        );
                      });
                    }
                )
              ],
            ),
          ),
        ));
  }
}
