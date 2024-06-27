
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


 Future<bool> showDeleteDialog(BuildContext context,String title,String description,String buttonName) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            child:const Text("Cancel"),
            onPressed: () {
              AutoRouter.of(context).pop(false); // Return false when canceled
            },
          ),
          TextButton(
            child:Text(buttonName),
            onPressed: () {
              AutoRouter.of(context).pop(true); // Return true when confirmed
            },
          ),
        ],
      );
    },
  ).then((value) => value ?? false); // Handle null case
}