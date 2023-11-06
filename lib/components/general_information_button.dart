import 'package:flutter/material.dart';
import 'package:marc/pages/general_information_page.dart';

class GeneralInformationButton extends StatefulWidget {
  const GeneralInformationButton(
      {super.key,
      required this.parkingFee1,
      required this.parkingName,
      required this.parkingStatus,
      required this.parkingNameCollection});

  final String parkingFee1;
  final String parkingName;
  final String parkingStatus;
  final String parkingNameCollection;

  @override
  State<GeneralInformationButton> createState() =>
      _GeneralInformationButtonState();
}

class _GeneralInformationButtonState extends State<GeneralInformationButton> {
  void parkingDialog(title, information, color) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(color)),
            ),
            content: Text(
                information),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'O K',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
  }

  // there is an issue with context
  // where it could only be used in a StatefulWidget
  // when implementing the following function in a StatelessWidget
  // it won't work
  // hence the creation of this separate component to be used for navigation
  void showGeneralInformation() {
    if (widget.parkingStatus == "Available") {
      // to prevent from coming back to here
      Navigator.pop(context);
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GeneralInformationPage(
            parkingFee: widget.parkingFee1,
            parkingName: widget.parkingName,
            parkingNameCollection: widget.parkingNameCollection,
          ),
        ),
      );
    } else if (widget.parkingStatus == "Maintenance") {
      parkingDialog("Maintenance",
          "Parking is unavailable due to maintenance. We apologize for the inconvenience caused.",
          0xFFF86F03);
    } else if (widget.parkingStatus == "Full") {
      parkingDialog("Full",
          "There is no parking available at the moment. Please visit another motorcycle parking lot. Thank you.",
          0xFFFF0303);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showGeneralInformation,
      child: Container(
        height: 45,
        width: 345,
        decoration: BoxDecoration(
          color: Color(0xFFCF0A0A),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          "PURCHASE A CARD",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
    );
  }
}
