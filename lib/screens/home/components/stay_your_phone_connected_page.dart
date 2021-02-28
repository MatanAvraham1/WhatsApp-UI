import 'package:flutter/material.dart';

class StayYourPhoneConnectedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/phone_connected.jpg",
              width: 400,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Keep your phone connected!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
