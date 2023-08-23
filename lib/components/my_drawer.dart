import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marc/components/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onHistoryTap;
  final void Function()? onLogoutTap;
  final void Function()? onProfileTap;

  const MyDrawer(
      {super.key, required this.onHistoryTap, required this.onLogoutTap, required this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Color(0xFFD9D5D5),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      // backgroundColor: Color(0xFF222831),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // header
              DrawerHeader(
                // child: Icon(
                //   // Icons.ac_unit_sharp, // need to change to the app icon
                //   // Image.asset('lib/images/MARC_Icon.png'),
                //   // color: Colors.white,
                //   // size: 69,
                // ),

                // child: Text(''),
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //       image: AssetImage('lib/images/MARC_Icon_Large.png')),
                // ),

                child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/images/MARC_Icon_Large.png')),
                    )),
              ),

              // profile
              DrawerTile(
                  icon: Icons.person, onTap: onProfileTap, text: "P R O F I L E"),

              // keys
              DrawerTile(
                icon: Icons.credit_card,
                onTap: onHistoryTap,
                text: "H I S T O R Y",
              ),

              // information
              DrawerTile(
                  icon: Icons.info,
                  onTap: () {},
                  text: "I N F O R M A T I O N"),
            ],
          ),

          // logout
          Padding(
            padding: const EdgeInsets.only(bottom: 33.0),
            child: DrawerTile(
              icon: Icons.logout,
              onTap: onLogoutTap,
              text: "L O G O U T",
            ),
          )
        ],
      ),
    );
  }
}
