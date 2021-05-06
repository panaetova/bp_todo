import 'package:flutter/material.dart';

class SelectLabel extends StatefulWidget {
  @override
  _SelectLabelState createState() => _SelectLabelState();
}

class _SelectLabelState extends State<SelectLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF737373),
        height: MediaQuery.of(context).size.height - 400,
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Cancel", style: TextStyle(color: Colors.blueAccent, fontSize: 17),)),
                    Text("Select Labels", style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),),
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Done", style: TextStyle(color: Colors.blueAccent, fontSize: 17),)),
                  ],
                ),
                TextField(

                )
              ],
            ),
          ),
        ));
  }
}
