// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Model/ChatModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  TextEditingController _controller = TextEditingController();
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        // backgroundColor: const Color(0xFF075E54),
        titleSpacing: 0,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.arrow_back,
              size: 24,
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                widget.chatModel.isGroup
                    ? 'assets/group.svg'
                    : 'assets/person.svg',
                color: Colors.white,
                height: 38,
                width: 37,
              ),
            )
          ]),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: const TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'last seen today at 12.00',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'Clicked View Contact',
                  child: Text('View Contact'),
                ),
                const PopupMenuItem(
                  value: 'Clicked Media',
                  child: Text('Media'),
                ),
                const PopupMenuItem(
                  value: 'Whatsapp Web',
                  child: Text('Whatsapp Web'),
                ),
                const PopupMenuItem(
                  value: 'Clicked search',
                  child: Text('Search'),
                ),
                const PopupMenuItem(
                  value: 'Clicked Mute',
                  child: Text('Mute'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          ListView(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                        margin: const EdgeInsets.only(
                          left: 2,
                          right: 2,
                          bottom: 8,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          controller: _controller,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a message',
                            // prefixIcon: IconButton(
                            //   icon: const Icon(
                            //     Icons.emoji_emotions,
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       show = !show;
                            //     });
                            //   },
                            // ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (builder) => bottomsheet(),
                                      );
                                    },
                                    icon: const Icon(Icons.attach_file)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.camera)),
                              ],
                            ),
                            contentPadding: const EdgeInsets.all(5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        right: 2,
                        left: 2,
                      ),
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 8, 185, 103),
                        foregroundColor: Colors.white,
                        radius: 25,
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.mic)),
                      ),
                    ),
                  ],
                ),
                // show ? emojiSelect() : Container(),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  // Widget emojiSelect() {
  //   return EmojiPicker(
  //       config: const Config(
  //         columns: 7,
  //       ),
  //       // rows:4,
  //       // columns : 7,
  //       onEmojiSelected: (category, emoji) {
  //         print(emoji);
  //       });
  // }

  Widget bottomsheet() {
    return SizedBox(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.insert_drive_file,
                    Colors.indigo,
                    'Documents',
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.camera_alt,
                    Colors.pink,
                    'Camera',
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.insert_photo,
                    Colors.purple,
                    'Gallery',
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.headphones,
                    Colors.amber,
                    'Audio',
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.location_pin,
                    Colors.teal,
                    'Location',
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.person,
                    Colors.lightBlue,
                    'Contact',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget iconCreation(IconData icon, Color color, String text) {
  return InkWell(
    onTap: () {},
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}
