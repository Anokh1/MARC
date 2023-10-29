import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marc/components/general_information_button.dart';
import 'package:marc/components/navigation_map.dart';
import 'package:marc/components/parking_lot_tile.dart';
import '../components/my_big_button.dart';
import '../components/my_carousel.dart';
import '../components/my_large_tile.dart';

class ParkingLotInformationPage extends StatelessWidget {
  const ParkingLotInformationPage({
    super.key,
    required this.currentParking,
  });

  final String currentParking;

  // this is the error faced when changed to StatelessWidget to connect to Firebase
  // need to create another component for this
  // already created on 27/08/23

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            "M A R C",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Parking")
              .doc(currentParking)
              .snapshots(),
          builder: (context, snapshot) {
            // get
            if (snapshot.hasData) {
              final parkingData = snapshot.data!.data() as Map<String, dynamic>;

              // default color for Available status of parking lot
              int parkingStatusColor = 0xFF17BC86;

              if (parkingData['status'] == "Maintenance") {
                parkingStatusColor = 0xFFF86F03;
              } else if (parkingData['status'] == "Full") {
                parkingStatusColor = 0xFFFF0303;
              }

              // rain information
              String rainImagePath = "";
              int rainStatusColor = 0;
              String rainStatusText = ""; 

              if (parkingData['rain'] == "") {
                rainImagePath = "lib/images/sad.png";
                rainStatusColor = 0xFFF7F7F7;
                rainStatusText = "No Information";
              } else if (parkingData['rain'] == "raining") {
                rainImagePath = "lib/images/definitely_raining.png";
                rainStatusColor = 0xFFBFDCE5;
                rainStatusText = "Definitely Raining";
              } else if (parkingData['rain'] == "rainless") {
                rainImagePath = "lib/images/clouds.png";
                rainStatusColor = 0xFFFFF2F2;
                rainStatusText = "No Rain";
              }


              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(parkingData['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      MyCarousel(
                        currentParking: currentParking,
                      ),
                      MyBigButton(
                          onTap: () {},
                          text: parkingData['status'],
                          color: Color(parkingStatusColor)),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyLargeTile(
                              onTap: () {},
                              text: rainStatusText,
                              color: Color(rainStatusColor),
                              image: rainImagePath),
                          const SizedBox(
                            width: 15,
                          ),
                          ParkingLotTile(
                              onTap: () {NavigationMap.adAppleTV();},
                              color: Color(0xFFFFFFFF),
                              image: 'lib/images/apple_tv.png'),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Parking Fee : RM " + parkingData['price'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      GeneralInformationButton(
                        parkingFee1: parkingData['price'],
                        parkingName: parkingData['name'],
                        parkingStatus: parkingData['status'],
                        parkingNameCollection: currentParking,
                      )
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
