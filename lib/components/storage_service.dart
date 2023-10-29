import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart'; 

class FireStoreDataBase {
  String? downloadURL;
  String? downloadURL1; 
  String? downloadURL2; 
  List<String> downloadURLS = []; 

  String? mainURL;

  Future getData(parkingName) async {
    try {
      await downloadURLExample(parkingName); 
      return downloadURLS; 
      
    } catch (e) {
      debugPrint("Error - $e");
      return null; 
    }
  }

  Future getMain(parkingMain) async {
    try {
      await mainURLFunction(parkingMain);
      return mainURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null; 
    }
  }

  Future<void> mainURLFunction(parkingMain) async {
    mainURL = await FirebaseStorage.instance.ref(parkingMain).child("main.png").getDownloadURL();
  }

  Future<void> downloadURLExample(parkingName) async {

    downloadURL = await FirebaseStorage.instance.ref(parkingName).child("main.png").getDownloadURL();
    downloadURLS.add(downloadURL.toString()); 
    downloadURL1 = await FirebaseStorage.instance.ref(parkingName).child("second.png").getDownloadURL();
    downloadURLS.add(downloadURL1.toString()); 

    // jpg format works too!
    // downloadURL2 = await FirebaseStorage.instance.ref("gurneyPlaza").child("parking.jpg").getDownloadURL();
    // downloadURLS.add(downloadURL2.toString()); 

    // downloadURL = await FirebaseStorage.instance.ref("gurneyPlaza").child("2_best_size_paragon.png").getDownloadURL(); 
     
    // debugPrint(downloadURL.toString()); 
  }
}