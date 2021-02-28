import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants.dart';
import 'package:whatsapp/models/chat.dart';

class ChatInfoPage extends StatefulWidget {
  final Chat chat;

  const ChatInfoPage({Key key, this.chat}) : super(key: key);

  @override
  _ChatInfoPageState createState() => _ChatInfoPageState();
}

class _ChatInfoPageState extends State<ChatInfoPage> {
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> listDelegatechildren = [
      ListTile(
        title: Text("Mute notifications"),
        trailing: Switch(
          onChanged: (value) {
            setState(() {
              isMuted = value;
            });
          },
          value: isMuted,
        ),
      ),
      ListTile(
        title: Text("Custom notifications"),
      ),
      ListTile(
        title: Text("Media visibility"),
      ),
      ListTile(
        title: Text("Group settings"),
      ),
      Container(
        color: Colors.grey[200],
        height: 10,
      ),
      ListTile(
        title: Text("Disappearing messages"),
        subtitle: Text("Off"),
        trailing: Icon(Icons.timer, color: kTealGreenDarkerColor),
      ),
      ListTile(
        title: Text("Encryption"),
        subtitle: Text(
            "Messages and cals are end-to-end encrypted\nTap to learn more"),
        trailing: Icon(
          Icons.enhanced_encryption_sharp,
          color: kTealGreenDarkerColor,
        ),
      ),
      Container(
        color: Colors.grey[200],
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Container(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1 participant",
                style: TextStyle(color: kTealGreenDarkerColor),
              ),
              Icon(
                Icons.search,
                color: kTealGreenDarkerColor,
              )
            ],
          ),
        ),
      ),
      ListTile(
        title: Text("Add participants"),
        leading: CircleAvatar(
          backgroundColor: kTealGreenLighterColor,
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        ),
      ),
      ListTile(
        title: Text("Invite via link"),
        leading: CircleAvatar(
          backgroundColor: kTealGreenLighterColor,
          child: Icon(
            Icons.link,
            color: Colors.white,
          ),
        ),
      ),
    ];

    listDelegatechildren.addAll(List.generate(
        widget.chat.members.length,
        (index) => ListTile(
            title: Text(widget.chat.members[index]),
            leading: CircleAvatar(
              child: Icon(Icons.account_circle, color: Colors.white),
              backgroundColor: Colors.grey[200],
            ))));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kLightGreenColor,
            expandedHeight: 400.0,
            floating: false,
            pinned: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.chat.name),
              background: Hero(
                  tag: widget.chat.imageURL,
                  child: Image.asset(
                    widget.chat.imageURL,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(listDelegatechildren),
          ),
        ],
      ),
    );
  }
}
