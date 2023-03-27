import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_project/button/delete_button.dart';
import 'package:simple_project/button/edit_button.dart';

import '../model/data.dart';

class TableData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  String? _selectedGender;
  List<String> _genderList = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context);
    List data = myModel.data;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'No',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ),
          DataColumn(
            label: Text(
              'Name',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ),
          DataColumn(
            label: Text(
              'Email',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ),
          DataColumn(
            label: Text(
              'Gender',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ),
          DataColumn(
            label: Text(
              'Actions',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ),
        ],
        rows: <DataRow>[
          for (int i = 1; i <= data.length; i++)
            DataRow(cells: <DataCell>[
              DataCell(Text(i.toString())),
              DataCell(Text(data[i - 1]["name"])),
              DataCell(Text(data[i - 1]["email"])),
              DataCell(Text(data[i - 1]["gender"])),
              DataCell(Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // THIS BUTTON FOR EDIT
                  EditButton(index: i),

                  SizedBox(width: 8),

                  // THIS BUTTON FOR DELETE
                  DeleteButton(index: i - 1)
                ],
              )),
            ]),
        ],
      ),
    );
  }
}
