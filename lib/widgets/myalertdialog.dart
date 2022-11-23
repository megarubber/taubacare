import 'package:flutter/material.dart';

class MyAlertDialog {
  final BuildContext context;
  final String title;
  final String message;

  const MyAlertDialog({
    Key? key,
    required this.context,
    required this.title,
    required this.message
  }) : super(key: key);

  void spawnConfirmAlert({VoidCallback? execute = null}) {
    showDialog(
      context: this.context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(this.title),
          content: Text(this.message),
          actions: <Widget>[
            TextButton(
              child: Text("Ok"),
              onPressed: () => execute == null ?
              Navigator.of(context).pop() : execute()
            )
          ]
        );
      }
    );
  }
}