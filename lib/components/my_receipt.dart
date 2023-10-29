import 'package:flutter/material.dart';
import 'package:marc/components/my_small_button.dart';
import 'package:marc/components/navigation_map.dart';
import 'package:marc/components/storage_service.dart';
import 'package:url_launcher/url_launcher.dart';

class MyReceipt extends StatefulWidget {
  const MyReceipt({
    super.key,
    required this.paymentName,
    required this.date,
    required this.time,
    required this.paymentAmount,
  });

  final String paymentName;
  final String date;
  final String time;
  final String paymentAmount;

  @override
  State<MyReceipt> createState() => _MyReceiptState();
}

class _MyReceiptState extends State<MyReceipt> {
  Future<void> _launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String mainImage = "";
    String mainLat = "";
    String mainLng = "";

    if (widget.paymentName == "Gurney Paragon") {
      mainImage = "gurneyParagon";
    } else if (widget.paymentName == "Gurney Plaza") {
      mainImage = "gurneyPlaza";
    } else if (widget.paymentName == "Queensbay Mall") {
      mainImage = "queensbayMall";
    } else if (widget.paymentName == "Prangin Mall") {
      mainImage = "pranginMall";
    }

    if (widget.paymentName == "Gurney Paragon") {
      mainLat = "5.4357";
      mainLng = "100.3112";
    } else if (widget.paymentName == "Gurney Plaza") {
      mainLat = "5.4380";
      mainLng = "100.3100";
    } else if (widget.paymentName == "Queensbay Mall") {
      mainLat = "5.3332";
      mainLng = "100.3066";
    } else if (widget.paymentName == "Prangin Mall") {
      mainLat = "5.4146";
      mainLng = "100.3312";
    }

    return FutureBuilder(
      future: FireStoreDataBase().getMain(mainImage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {

            return Container(
              height: 280,
              width: 345,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(widget.paymentName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: 280,
                  child: Column(
                    children: [
                      Image.asset('lib/images/MARC_Icon_Small.png'),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "RM " + widget.paymentAmount,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.date,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.time,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
              ]),
            );
          } else {
            // for the parking payment receipt
            String mainUrl = snapshot.data;

            return Container(
              height: 540,
              width: 345,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(widget.paymentName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: 280,
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(mainUrl,
                              fit: BoxFit.cover, width: 300.0)),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.paymentAmount,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.date,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.time,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Parking Type",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Outdoor",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Expiry Time",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "11:59 PM",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "This key will be ",
                            style: TextStyle(color: Colors.grey, fontSize: 7),
                          ),
                          Text(
                            "expired ",
                            style: TextStyle(
                                color: Color(0xFFCF0A0A),
                                fontSize: 7,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "according to the ",
                            style: TextStyle(color: Colors.grey, fontSize: 7),
                          ),
                          Text(
                            "date ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 7,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "and ",
                            style: TextStyle(color: Colors.grey, fontSize: 7),
                          ),
                          Text(
                            "expiry time ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 7,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "stated above.",
                            style: TextStyle(color: Colors.grey, fontSize: 7),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your entry will be ",
                            style: TextStyle(color: Colors.grey, fontSize: 7),
                          ),
                          Text(
                            "denied ",
                            style: TextStyle(
                                color: Color(0xFFCF0A0A),
                                fontSize: 7,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "after the expiry time. Please purchase a ",
                            style: TextStyle(color: Colors.grey, fontSize: 7),
                          ),
                          Text(
                            "new ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 7,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "card.",
                            style: TextStyle(color: Colors.grey, fontSize: 7),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MySmallButton(
                              onTap: () {
                                NavigationMap.showMap(mainLat, mainLng);
                              },
                              text: "NAVIGATION",
                              color: Color(0xFF1C7947)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
              ]),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
