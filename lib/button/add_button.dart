import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data.dart';

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  String? _selectedGender = "Male";
  List<String> _genderList = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context);
    List data = myModel.data;
    return Container(
      child: SizedBox(
        height: 50,
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 73, 185, 149)),
              onPressed: () {
                // ====>>>> ini untuk form add new
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    TextEditingController namaControler =
                        TextEditingController();
                    TextEditingController emailControler =
                        TextEditingController();
                    TextEditingController genderControler =
                        TextEditingController();
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
                                  genderControler = TextEditingController(
                                      text: _selectedGender);
                                  print(_selectedGender);
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
                              data.add({
                                "name": namaControler.text,
                                "email": emailControler.text,
                                "gender": genderControler.text
                              });

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
              },
              // ini untuk tombol tambah new
              child: Text('Add New'),
            ),
          ),
        ),
      ), // access data variable from MyWidget
    );
  }
}
