import 'package:hs_chat/CustomUI/ButtonCard.dart';
import 'package:hs_chat/CustomUI/ContactCard.dart';
import 'package:hs_chat/Model/ChatModel.dart';
import 'package:hs_chat/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: 'Anjula',
        about: 'Pissottek',
      ),
      ChatModel(
        name: 'Perera',
        about: 'Gammac',
      ),
      ChatModel(
        name: 'Junuju',
        about: 'elama ela',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Select Contact',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '255 contacts',
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
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'Clicked Invite a friend',
                  child: Text('Invite a friend'),
                ),
                const PopupMenuItem(
                  value: 'Clicked contacts',
                  child: Text('Contacts'),
                ),
                const PopupMenuItem(
                  value: 'clicked Refresh',
                  child: Text('Refresh'),
                ),
                const PopupMenuItem(
                  value: 'Clicked Help',
                  child: Text('Help'),
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => CreateGroup()));
              },
              child: const ButtonCard(
                icon: Icons.group,
                name: 'New Group',
              ),
            );
          } else if (index == 1) {
            return const ButtonCard(
              icon: Icons.person_add,
              name: 'New Contact',
            );
          }
          return ContactCard(contact: contacts[index - 2]);
        },
      ),
    );
  }
}
