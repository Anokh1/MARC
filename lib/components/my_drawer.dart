import 'package:flutter/material.dart';
import 'package:marc/components/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onHistoryTap;
  final void Function()? onLogoutTap;
  final void Function()? onProfileTap;
  final void Function()? onHelmetTap;

  const MyDrawer(
      {super.key, required this.onHistoryTap, required this.onLogoutTap, required this.onProfileTap, required this.onHelmetTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // header
              DrawerHeader(
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
                  icon: Icons.heat_pump,
                  onTap: onHelmetTap,
                  text: "H E L M E T   S H O P"),
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
