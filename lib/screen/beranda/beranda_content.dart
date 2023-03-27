import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_project/button/add_button.dart';

import '../../model/data.dart';
import '../../table/data_table.dart';

class BerandaContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BerandaContentState();
}

class _BerandaContentState extends State<BerandaContent> {
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context);
    List data = myModel.data;
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListView(
              children: [
                Container(
                    height: 100,
                    width: 100,
                    color: Color.fromARGB(255, 13, 49, 15),
                    child: Center(
                      child: Text(
                        "WELCOME",
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 50,
                            fontWeight: FontWeight.w800),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                children: [
                  // THIS FUNCTION FOR BUTTON "Add New"
                  AddButton(),
                  // THIS IS FOR THE TABLE
                  TableData(),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Wrap(),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
