import 'package:whatsapp/models/message.dart';

class Chat {
  String name;
  String imageURL;
  List<String> members;
  List<Message> messages;

  Chat({this.name, this.members, this.messages, this.imageURL});
}
