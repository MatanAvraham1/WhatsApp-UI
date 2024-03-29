import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:whatsapp/animations/slide_rigth_route.dart';
import 'package:whatsapp/models/chat.dart';
import 'package:whatsapp/screens/home/chats/chat_info_page.dart';
import 'package:whatsapp/screens/home/chats/chat_page.dart';

class ChatTile extends StatefulWidget {
  final Chat chat;
  final Function selectChatOnDesktop;
  final Function openChatInfoOnDesktop;

  const ChatTile(
      {Key key,
      this.chat,
      this.selectChatOnDesktop,
      this.openChatInfoOnDesktop})
      : super(key: key);

  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  void selectChatOnMobile() {
    setState(() {
      isHeroEnabled = false;
    });

    Navigator.of(context).push(SlideRightRoute(
        page: ChatPage(
      chat: widget.chat,
    )));
  }

  bool isHeroEnabled = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        var deviceType = getDeviceType(MediaQuery.of(context).size);

        if (deviceType == DeviceScreenType.mobile) {
          selectChatOnMobile();
        } else if (deviceType == DeviceScreenType.desktop ||
            deviceType == DeviceScreenType.tablet) {
          widget.selectChatOnDesktop(widget.chat);
        }
      },
      title: Text(widget.chat.name),
      subtitle: Text(widget.chat.messages[0].content),
      leading: InkWell(
        onTap: () {
          setState(() {
            isHeroEnabled = true;
          });

          var deviceType = getDeviceType(MediaQuery.of(context).size);

          if (deviceType == DeviceScreenType.mobile) {
            Navigator.of(context).push(SlideRightRoute(
                page: ChatInfoPage(
              chat: widget.chat,
            )));
          } else if (deviceType == DeviceScreenType.desktop ||
              deviceType == DeviceScreenType.tablet) {
            widget.selectChatOnDesktop(widget.chat);
            widget.openChatInfoOnDesktop();
          }
        },
        child: Hero(
          tag: isHeroEnabled
              ? widget.chat.imageURL
              : widget.chat.imageURL + "lalla",
          child: CircleAvatar(
            backgroundImage: AssetImage(widget.chat.imageURL),
          ),
        ),
      ),
      // leading: OpenContainer(
      //   closedShape: CircleBorder(),
      //   closedBuilder: (context, action) => CircleAvatar(
      //     backgroundImage: AssetImage(widget.chat.imageURL),
      //   ),
      // openBuilder: (context, action) => ChatInfoPage(
      //   chat: widget.chat,
      // ),
      // ),
    );
  }
}
