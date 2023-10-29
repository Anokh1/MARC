import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/storage_service.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key, required this.currentParking});

  final String currentParking;

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  List<String> imageUrls = [];

  List imageURLS = [];

  final String image2 =
      "https://firebasestorage.googleapis.com/v0/b/marc-6d5c6.appspot.com/o/gurneyPlaza%2Fsecond.png?alt=media&token=fe5e31fa-250a-45e4-a423-ba8941050e4f";

  final String image3 = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // widget.current parking is from the another class above
      future: FireStoreDataBase().getData(widget.currentParking),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          // need to append to the list first
          // if not you fucked up :D
          // imageUrls.add(snapshot.data.toString());

          imageUrls = snapshot.data;

          List<String> imgList = [
            imageUrls[0],
            imageUrls[1],
            // imageUrls[2],
          ];

          final List<Widget> imageSliders = imgList
              .map((item) => Container(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 20,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(item,
                                  fit: BoxFit.cover, width: 1000.0),
                            ],
                          )),
                    ),
                  ))
              .toList();

          return Container(
              child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: imageSliders,
          ));
        }
        // need to return something here
        // if not go error :'D
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
