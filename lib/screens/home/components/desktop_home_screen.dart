import 'package:flutter/material.dart';
import 'package:whatsapp/animations/fade_and_slide_animation.dart';
import 'package:whatsapp/models/chat.dart';
import 'package:whatsapp/screens/home/chats/chat_info_page.dart';
import 'package:whatsapp/screens/home/chats/chat_page.dart';
import 'package:whatsapp/screens/home/chats/chats_page.dart';
import 'package:whatsapp/screens/home/components/stay_your_phone_connected_page.dart';

class DesktopHomeScreen extends StatefulWidget {
  @override
  _DesktopHomeScreenState createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen>
    with SingleTickerProviderStateMixin {
  Chat selectedChat;
  bool isChatInfoOpend = false, isAnimatedContainerClosing = false;
  int _chatsPageFlex = 2, _chatItselfFlex = 4, _infoChatFlex = 2;

  void selectChatOnDesktop(Chat chat) {
    setState(() {
      this.selectedChat = chat;
    });
  }

  void openChatInfoOnDesktop() {
    setState(() {
      this.isChatInfoOpend = true;
    });
  }

  void closeChatInfo() {
    setState(() {
      this.isChatInfoOpend = false;
    });
  }

  void openCreateChatPage() {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    var infoPageWidth = (_infoChatFlex * width) /
        (_chatsPageFlex + _chatItselfFlex + _infoChatFlex);

    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: _chatsPageFlex,
            child: FadeAndTransitionAnimation(
              child: Scaffold(
                appBar: AppBar(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 45,
                  ),
                  actions: [
                    IconButton(icon: Icon(Icons.data_usage), onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.chat), onPressed: openCreateChatPage),
                    IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                  ],
                ),
                body: ChatsPage(
                  selectChatOnDesktop: selectChatOnDesktop,
                  openChatInfoOnDesktop: openChatInfoOnDesktop,
                ),
              ),
            ),
          ),
          Flexible(
            flex: _chatItselfFlex,
            child: selectedChat == null
                ? StayYourPhoneConnectedPage()
                : ChatPage(
                    chat: selectedChat,
                    openChatInfoOnDesktop: openChatInfoOnDesktop,
                  ),
          ),
          AnimatedContainer(
            onEnd: () {},
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
            width: isChatInfoOpend ? infoPageWidth : 0,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Group Info"),
                leading: CloseButton(
                  onPressed: closeChatInfo,
                  color: Colors.white,
                ),
              ),
              body: FutureBuilder(
                future: Future.delayed(Duration(milliseconds: 20)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  }
                  return FadeAndTransitionAnimation(
                    child: selectedChat == null
                        ? Container()
                        : ChatInfoPage(
                            chat: selectedChat,
                          ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
