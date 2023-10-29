// return a formatted data as a string

import 'package:cloud_firestore/cloud_firestore.dart';

String formatDate(Timestamp timestamp) {
  // Timestamp is the object retrieved from Firebase
  // To display it, convert the Timestamp to String format
  DateTime dateTime = timestamp.toDate();

  // get year
  String year = dateTime.year.toString();

  // get month
  String month = dateTime.month.toString();

  // get day
  String day = dateTime.day.toString();

  // final formatted date
  String formatedDate = '$day/$month/$year';

  return formatedDate;
}

String formatParkingIdDate(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  // get year
  String year = dateTime.year.toString();

  // get month
  String month = dateTime.month.toString();

  // get day
  String day = dateTime.day.toString();

  // final formatted date
  String formatedParkingIdDate = "_" + day + "_" + month + "_" + year;

  return formatedParkingIdDate;
}

String formatTime(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  String finalFormatedTime = "";

  // get hour
  String hour = dateTime.hour.toString();

  // get minute
  String minute = dateTime.minute.toString();

  // get the AM PM

  // final formatted time
  if (minute.length == 2) {
    // String formatedTime = '$hour:$minute';
    String formatedTime = hour + ":" + minute;
    finalFormatedTime = formatedTime;
  } else {
    String formatedTime = hour + ":0" + minute;
    finalFormatedTime = formatedTime;
  }

  return finalFormatedTime;
}
