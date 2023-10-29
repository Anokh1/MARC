// this got use
// please check 
import 'package:flutter/material.dart';

class NumberPlateButton extends StatelessWidget {
  const NumberPlateButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    Future<void> editNumberPlate() async {
      String newValue = "";
      String editFieldName = "number plate";

      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          title: Text(
            "Edit " + editFieldName,
          ),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Enter new " + editFieldName,
            ),
            // I missed this line and the data cannot be updated
            onChanged: (value) {
              newValue = value;
            },
          ),
          actions: [
            // cancel button
            TextButton(
              child: Text(
                "Cancel",
              ),
              onPressed: () => Navigator.pop(context),
            ),

            // save button
            TextButton(
              child: Text(
                "Save",
              ),
              onPressed: () => Navigator.of(context).pop(newValue),
            )
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => editNumberPlate(),
      child: Container(
        height: 45,
        width: 345,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
    );
  }
}
