import 'package:flutter/material.dart';
import 'package:whatsapp/constants.dart';
import 'package:whatsapp/models/message.dart';

class MessageTile extends StatelessWidget {
  final Message message;
  MessageTile({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.hasSentByMe() ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Color(0x22000000),
              offset: Offset(1, 2),
            ),
          ],
          borderRadius: message.hasSentByMe()
              ? BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  topRight: Radius.circular(1),
                  topLeft: Radius.circular(8),
                )
              : BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(1),
                ),
          color:
              message.hasSentByMe() ? kOutgoingChatBubbleColor : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.content,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              message.sentAt.hour.toString() +
                  ":" +
                  message.sentAt.minute.toString(),
              style: TextStyle(fontSize: 12, color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
