import 'package:flutter/material.dart';

class MediaTypeTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const MediaTypeTile({Key key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: Color(0xffF1F1F1),
      ),
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: Color(0xff6F6F6F),
              size: 20,
            ),
            Text(
              " " + title,
              style: TextStyle(color: Color(0xff7D7D7D)),
            ),
          ],
        ),
      ),
    );
  }
}
