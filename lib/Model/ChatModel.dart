class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String about;
  bool select = false;
  // String contact;

  ChatModel({
    this.name = '',
    this.icon = '',
    this.isGroup = false,
    this.time = '',
    this.currentMessage = '',
    this.about = '',
    this.select = false,
    // this.contact = ''
  });
}
