import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:whatsapp/animations/fade_and_slide_animation.dart';
import 'package:whatsapp/animations/slide_rigth_route.dart';
import 'package:whatsapp/models/chat.dart';
import 'package:whatsapp/models/message.dart';
import 'package:whatsapp/screens/home/chats/chat_info_page.dart';
import 'package:whatsapp/screens/home/chats/components/message_tile.dart';
import 'package:whatsapp/screens/home/chats/components/send_message_form.dart';

class ChatPage extends StatefulWidget {
  final Chat chat;
  final Function openChatInfoOnDesktop;

  ChatPage({Key key, this.chat, this.openChatInfoOnDesktop}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void addMesasge(Message message) {
    setState(() {
      widget.chat.messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: InkWell(
          onTap: () {
            var deviceType = getDeviceType(MediaQuery.of(context).size);

            if (deviceType == DeviceScreenType.mobile) {
              Navigator.of(context).push(SlideRightRoute(
                  page: ChatInfoPage(
                chat: widget.chat,
              )));
            } else if (deviceType == DeviceScreenType.desktop ||
                deviceType == DeviceScreenType.tablet) {
              widget.openChatInfoOnDesktop();
            }
          },
          child: AppBar(
            leadingWidth: getValueForScreenType(
                mobile: 88, desktop: 50, tablet: 50, context: context),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chat.name),
                Text(
                  widget.chat.members.toString(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                )
              ],
            ),
            leading: ResponsiveBuilder(
              // ignore: missing_return
              builder: (context, sizingInformation) {
                if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile) {
                  return Row(
                    children: [
                      if (getDeviceType(MediaQuery.of(context).size) ==
                          DeviceScreenType.mobile)
                        BackButton(),
                      Hero(
                        tag: widget.chat.imageURL,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(widget.chat.imageURL),
                        ),
                      ),
                    ],
                  );
                } else if (sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop ||
                    sizingInformation.deviceScreenType ==
                        DeviceScreenType.tablet) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.chat.imageURL),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/chat_background.png"))),
        child: Stack(
          children: [
            FadeAndTransitionAnimation(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          color: Color(0x22000000),
                          offset: Offset(1, 2),
                        ),
                      ],
                      color: Color(0xffE1F3FB),
                    ),
                    child: Text(
                      "Today",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w100),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: widget.chat.messages.length,
                      itemBuilder: (context, index) =>
                          MessageTile(message: widget.chat.messages[index]),
                    ),
                  ),
                ),
                SendMessageForm(
                  addMessage: addMesasge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
