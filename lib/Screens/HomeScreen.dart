import 'package:hs_chat/Pages/ChatPage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0xFF075E54),
        title: const Text("HealthSpace"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'New Groups',
                  child: Text('New Group'),
                ),
                const PopupMenuItem(
                  value: 'New Broadcast',
                  child: Text('New Broadcast'),
                ),
                const PopupMenuItem(
                  value: 'Whatsapp Web',
                  child: Text('Whatsapp Web'),
                ),
                const PopupMenuItem(
                  value: 'Starred Messages',
                  child: Text('Starred Messages'),
                ),
                const PopupMenuItem(
                  value: 'Settings',
                  child: Text('Settings'),
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            // Tab(
            //   text: 'STATUS',
            // ),
            // Tab(
            //   text: 'CALLS',
            // ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          Text('Camera'),
          ChatPage(),
          // Text('Status'),
          // Text('Calls'),
        ],
      ),
    );
  }
}
