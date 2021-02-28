class Message {
  String sender;
  DateTime sentAt;
  String content;

  Message({this.sender, this.sentAt, this.content});

  bool hasSentByMe() {
    if (this.sender == "matan") return true;

    return false;
  }
}
