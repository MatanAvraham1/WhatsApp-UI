import 'package:flutter/material.dart';
import 'package:whatsapp/constants.dart';
import 'package:whatsapp/models/message.dart';

class SendMessageForm extends StatefulWidget {
  final Function addMessage;

  const SendMessageForm({Key key, this.addMessage}) : super(key: key);

  @override
  _SendMessageFormState createState() => _SendMessageFormState();
}

class _SendMessageFormState extends State<SendMessageForm> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void sendMessage() {
    Message message = Message(
        content: _textEditingController.text,
        sentAt: DateTime.now(),
        sender: "matan");
    cleanMessageForm();
    widget.addMessage(message);
  }

  void cleanMessageForm() {
    setState(() {
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.emoji_emotions_outlined,
                          size: 22,
                          color: Colors.black38,
                        ),
                        onPressed: () {}),
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 6,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type your message"),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    if (_textEditingController.text == "")
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.attach_file,
                                size: 22,
                                color: Colors.black38,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                Icons.camera_alt_rounded,
                                size: 22,
                                color: Colors.black38,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          child: FloatingActionButton(
            backgroundColor: kTealGreenLighterColor,
            child: Icon(
              _textEditingController.text == "" ? Icons.mic : Icons.send,
              color: Colors.white,
            ),
            onPressed: _textEditingController.text == "" ? () {} : sendMessage,
          ),
        ),
      ],
    );
  }
}
