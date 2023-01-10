import 'package:hs_chat/CustomUI/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:hs_chat/Model/ChatModel.dart';
import 'package:hs_chat/Screens/SelectContact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "devstack",
        icon: "person.svg",
        isGroup: false,
        time: "4.00",
        currentMessage: "currentMessage",
        about: ''),
    ChatModel(
      name: "anjo",
      icon: "person.svg",
      isGroup: false,
      time: "4.09",
      currentMessage: "nextMessage",
      about: '',
    ),
    ChatModel(
      name: "gigiri",
      icon: "person.svg",
      isGroup: false,
      time: "5.00",
      currentMessage: "hmmm",
      about: '',
    ),
    ChatModel(
      name: "devstack and anjo",
      icon: "group.svg",
      isGroup: true,
      time: "4.00",
      currentMessage: "hi group",
      about: '',
    ),
    ChatModel(
      name: "gr5",
      icon: "group.svg",
      isGroup: true,
      time: "9.50",
      currentMessage: "ofjopfn",
      about: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SelectContact()));
          },
          child: const Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (contex, index) => CustomCard(
            chatModel: chats[index],
          ),
        ));
  }
}
