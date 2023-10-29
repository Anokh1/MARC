import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationMap {
  NavigationMap._();

  static Future<void> showMap(
    String Lat,
    String Lng,
  ) async {
    // String mapURL = "https://www.google.com/maps/search/?api=1&query=$Lat,$Lng";
    // Uri location = Uri.parse("https://www.google.com/maps/search/?api=1&query=$Lat,$Lng");
    // Uri location = Uri.parse("comgooglemaps://?center=$Lat,$Lng");
    // Uri location = Uri.parse("https://www.google.com/maps/search/?api=1&query=$Lat,$Lng");
    String loc = "https://www.google.com/maps/search/?api=1&query=$Lat,$Lng";
    Uri location = Uri.parse(loc);

    if (await canLaunchUrl(location)) {
      await launchUrl(location, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not get navigation information";
    }
  }

  static Future<void> shopeeHelmet() async {
    String surl =
        "https://shopee.com.my/kedai_penjual_helmet?gclid=EAIaIQobChMIpOjC9-fZgQMVyM5MAh14cwGEEAAYASAAEgIwbfD_BwE";
    Uri shopeeUrl = Uri.parse(surl);

    if (await canLaunchUrl(shopeeUrl)) {
      await launchUrl(shopeeUrl, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Failed to open Shopee Url");
    }
  }

  static Future<void> adAppleTV() async {
    String atvurl =
        "https://tv.apple.com";
    Uri adAppleTVUrl = Uri.parse(atvurl);

    if (await canLaunchUrl(adAppleTVUrl)) {
      await launchUrl(adAppleTVUrl, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Failed to open Ad Apple TV Url");
    }
  }
}
