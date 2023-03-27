import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data.dart';

class DeleteButton extends StatelessWidget {
  final int index;
  // final Function(int) deleteItem;

  DeleteButton({required this.index});

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context);
    List data = myModel.data;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () {
        data.removeAt(index);
        myModel.updateValue(data);
      },
      child: Text("Delete"),
    );
  }
}
