import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data.dart';

class EditButton extends StatefulWidget {
  final int index;

  EditButton({required this.index});

  @override
  _EditButtonState createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  String? _selectedGender = "Male";
  List<String> _genderList = ["Male", "Female"];
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context);
    List data = myModel.data;
    return ElevatedButton(
      onPressed: () {
        // Handle button press
        setState(() {
          _selectedGender = data[widget.index - 1]["gender"];
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController namaControler =
                  TextEditingController(text: data[widget.index - 1]["name"]);
              TextEditingController emailControler =
                  TextEditingController(text: data[widget.index - 1]["email"]);
              TextEditingController genderControler =
                  TextEditingController(text: data[widget.index - 1]["gender"]);
              final _formKey = GlobalKey<FormState>();
              return AlertDialog(
                title: Text('Add New'),
                content: Container(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        // controller yang akan menampung inputan dari form inputnya
                        controller: namaControler,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please input name";
                          }
                        },
                      ),
                      TextFormField(
                        controller: emailControler,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please input name";
                          }
                        },
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Gender',
                        ),
                        value: _selectedGender,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedGender = newValue;
                            genderControler =
                                TextEditingController(text: _selectedGender);
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select gender';
                          }
                          return null;
                        },
                        items: _genderList.map((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data[widget.index - 1] = {
                          "name": namaControler.text,
                          "email": emailControler.text,
                          "gender": genderControler.text
                        };
                        myModel.updateValue(data);
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Submit'),
                  ),
                ],
              );
            },
          );
        });
      },
      child: Text('Edit'),
    );
  }
}
