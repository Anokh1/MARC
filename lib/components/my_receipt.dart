import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/my_small_button.dart';

class MyReceipt extends StatefulWidget {
  const MyReceipt({super.key});

  @override
  State<MyReceipt> createState() => _MyReceiptState();
}

class _MyReceiptState extends State<MyReceipt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
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
          child: Text("Gurney Paragon",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Container(
          width: 280,
          child: Column(
            children: [
              // Image(image: 'lib/images/world.png'),
              Image.asset('lib/images/gurney_paragon_rounded.png'),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "RM 1.00",
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "24/7/2023",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "02:22 PM",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Outdoor",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "11:59 PM",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                height: 39,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MySmallButton(onTap: () {}, text: "NAVIGATION", color: Color(0xFF1C7947)),
                ],
              )
            ],
          ),
        ),
        
        // Text(
        //   "This key will be expired according to the date and expiry time stated above.",
        //   textAlign: TextAlign.center,
        //   style: TextStyle(color: Colors.grey, fontSize: 9),
        // ),
        // Text(
        //   "Your entry will be denied after the expiry time. Please purchase a new key.",
        //   textAlign: TextAlign.center,
        //   style: TextStyle(color: Colors.grey, fontSize: 9),
        // ),
        const SizedBox(
          height: 6,
        ),
      ]),
    );
  }
}
