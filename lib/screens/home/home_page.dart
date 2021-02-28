import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:whatsapp/screens/home/components/desktop_home_screen.dart';
import 'package:whatsapp/screens/home/components/mobile_home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return MobileHomeScreen();
      } else if (sizingInformation.deviceScreenType ==
              DeviceScreenType.desktop ||
          sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
        return DesktopHomeScreen();
      }
    });
  }
}
