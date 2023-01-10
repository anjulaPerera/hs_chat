import 'package:hs_chat/CustomUI/AvatarCard.dart';
// import 'package:chat_dev_stack/CustomUI/ButtonCard.dart';
import 'package:hs_chat/CustomUI/ContactCard.dart';
import 'package:hs_chat/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: 'Anjula', about: 'Pissottek'),
    ChatModel(name: 'Perera', about: 'Gammac'),
    ChatModel(name: 'Junuju', about: 'elama ela'),
    ChatModel(name: 'Anjula', about: 'Pissottek'),
    ChatModel(name: 'Perera', about: 'Gammac'),
    ChatModel(name: 'Junuju', about: 'elama ela'),
    ChatModel(name: 'Anjula', about: 'Pissottek'),
    ChatModel(name: 'Perera', about: 'Gammac'),
    ChatModel(name: 'Junuju', about: 'elama ela'),
    ChatModel(name: 'Anjula', about: 'Pissottek'),
    ChatModel(name: 'Perera', about: 'Gammac'),
    ChatModel(name: 'Junuju', about: 'elama ela'),
    ChatModel(name: 'Anjula', about: 'Pissottek'),
    ChatModel(name: 'Perera', about: 'Gammac'),
    ChatModel(name: 'Junuju', about: 'elama ela'),
    ChatModel(name: 'Anjula', about: 'Pissottek'),
    ChatModel(name: 'Perera', about: 'Gammac'),
    ChatModel(name: 'Junuju', about: 'elama ela'),
  ];

  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'New Group',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Add Participants',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 26,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groups.isNotEmpty ? 90 : 10,
                );
              }
              return InkWell(
                onTap: () {
                  if (contacts[index].select == false) {
                    setState(() {
                      contacts[index].select = true;
                      groups.add(contacts[index]);
                    });
                  } else {
                    setState(() {
                      contacts[index].select = false;
                      groups.remove(contacts[index]);
                    });
                  }
                },
                child: ContactCard(contact: contacts[index]),
              );
            },
          ),
          groups.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: contacts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (contacts[index].select == true) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  contacts[index].select = false;
                                  groups.remove(contacts[index]);
                                });
                              },
                              child: AvatarCard(
                                contact: contacts[index],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
