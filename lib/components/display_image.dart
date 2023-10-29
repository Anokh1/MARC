// should be not using this component already : 6/9/2023
// maybe can delete

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirestoreDisplayImage extends StatefulWidget {
  const FirestoreDisplayImage({super.key});

  @override
  State<FirestoreDisplayImage> createState() => _FirestoreDisplayImageState();
}

class _FirestoreDisplayImageState extends State<FirestoreDisplayImage> {

  late String imageUrl; 
  final storage = FirebaseStorage.instance;


  @override

  void initState() {
    super.initState();
    // set the initial value of imageUrl to empty
    imageUrl = ""; 
    // retrieve the image from Firebase Storage
    getImageUrl(); 
  }  

  Future <void> getImageUrl() async {
    // get the reference to the image file in Firebase Storage
    // final ref = storage.ref().child(""); 
    // final ref = storage.ref().child("gurneyPlaza/main.png"); 
    final ref = storage.ref().child("main.png"); 

    // final pathReference = FirebaseStorage.instance.ref().child("gurneyPlaza/main.png"); 

    // final ref = storage.ref().child("gurneyPlaza"); 
    // final ref1 = ref.child("main.png"); 
    // get the imageUrl to download the url 
    final url = await ref.getDownloadURL(); 
    setState(() {
      imageUrl = url; 
    });
  }
  
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Image(image: NetworkImage(imageUrl), 
      fit: BoxFit.cover,),
    );
  }
}