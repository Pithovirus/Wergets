import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Imported for system-related functionalities, not used in this code.

void main() {
  runApp(const MyApp()); // Runs the MyApp widget, starting the Flutter application.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner.
      theme: ThemeData.dark(), // Sets the app theme to dark mode.
      home: ChatScreen(), // Sets the home screen to ChatScreen.
    );
  }
}

class ChatScreen extends StatelessWidget {
  // List of chat data.
  final List<Chat> chats = [
    Chat(name: "ANGEL W/ WINGS!", message: "Goodmorning bebelabsss...", time: "Just now", isOnline: true, image: 'assets/images/ANGELIKA!.jpg'),
    Chat(name: "Girl BF Muwa..", message: "hulta lang makascore ka..", time: "2:23 PM", isOnline: true, image: 'assets/images/GBF.jpeg'),
    Chat(name: "Rasel Jade G...", message: "pass di sugtan uyab ko", time: "2:40 PM", isOffline: true, image: 'assets/images/rasel.jpg'),
    Chat(name: "Si Tiki <3 R...", message: "crush ko si Rasel", time: "2:40 PM", isOffline: true, image: 'assets/images/tiki.jpg'),
    Chat(name: "Reheno Balog...", message: "Shat ta ako timpla ah..", time: "2:41 PM", isOffline: true, image: 'assets/images/Reheno.jpg'),
    Chat(name: "Boss NOyNoy", message: "BOSSS!! BOSSINGG!! Kam..", time: "Thu", isOffline: true, image: 'assets/images/Boss.jpg'),
    Chat(name: "Jipone Tori", message: "sa GT na kmi pre", time: "Wed", isOffline: true, image: 'assets/images/jeph.jpg'),
    Chat(name: "Babe ni Deyb #2", message: "bata mo di gahibi..", time: "Mon", isOffline: true, image: 'assets/images/BABY.jpeg'),
  ];

  // List of friend avatars.
  final List<String> friendsAvatars = [
    'assets/images/papalem.jpg', 
    'assets/images/ANGELIKA!.jpg',
    'assets/images/jeph.jpg',
    'assets/images/Reheno.jpg',
    'assets/images/rasel.jpg',
  ];

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'), // Title of the app bar.
        actions: [
          IconButton(
            icon: const Icon(Icons.search), // Search icon button.
            onPressed: () {}, // Action to be defined later.
          ),
        ],
      ),  
      
      // App bar with title and search icon.
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 40), // Spacer for better layout.
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/papalem.jpg'), // User avatar.
                    radius: 30,
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Deyb Danosos", // Username displayed.
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Color.fromARGB(255, 246, 244, 244)), // Dropdown icon.
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white), // Settings icon.
                    onPressed: () {
                      // Action for settings can be defined here.
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5), // Spacer for better layout.
            // Drawer menu items.
            ListTile(
              leading: const Icon(Icons.chat), // Icon for Chats menu item.
              title: const Text('Chats'), // Title for Chats menu item.
              onTap: () {
                // Handle chat tap action.
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_basket), // Icon for Marketplace menu item.
              title: const Text('Marketplace'), // Title for Marketplace menu item.
              onTap: () {
                // Handle marketplace tap action.
              },
            ),
            ListTile(
              leading: const Icon(Icons.message), // Icon for Message Requests menu item.
              title: const Text('Message Requests'), // Title for Message Requests menu item.
              onTap: () {
                // Handle message requests tap action.
              },
            ),
            ListTile(
              leading: const Icon(Icons.archive), // Icon for Archive menu item.
              title: const Text('Archive'), // Title for Archive menu item.
              onTap: () {
                // Handle archive tap action.
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Row for displaying circular images (friend avatars).
          SizedBox(
            height: 70,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enables horizontal scrolling.
              child: Row(
                children: friendsAvatars.map((avatar) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0), // Adds spacing around avatars.
                    child: CircleAvatar(
                      backgroundImage: AssetImage(avatar), // Displays friend avatar.
                      radius: 30,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // Chat list displayed below the avatars.
          Expanded(
            child: ListView.builder(
              itemCount: chats.length, // Number of chats to display.
              itemBuilder: (context, index) {
                return ChatTile(chat: chats[index]); // Generates chat tile for each chat.
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Custom widget to represent each chat tile.
class ChatTile extends StatelessWidget {
  final Chat chat; // Holds chat data.

  const ChatTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(chat.image), // Displays chat avatar.
            radius: 25,
          ),
          // Online status indicator if the user is online.
          if (chat.isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 16, // Height of the online indicator.
                width: 16, // Width of the online indicator.
                decoration: BoxDecoration(
                  color: Colors.green, // Color of the indicator.
                  shape: BoxShape.circle, // Makes it circular.
                  border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 3), // Adds a border.
                ),
              ),
            ),
        ],
      ),
      title: Text(chat.name, style: const TextStyle(fontWeight: FontWeight.bold)), // Displays chat name.
      subtitle: Text(chat.message), // Displays last message.
      trailing: Text(chat.time), // Displays time of the last message.
    );
  }
}

// Model class to represent chat data.
class Chat {
  String name; // Name of the chat participant.
  String message; // Last message in the chat.
  String time; // Time the last message was sent.
  bool isOnline; // Online status of the participant.
  bool isOffline; // Offline status (not used in the code).
  String image; // URL/path of the participant's image.

  Chat({
    required this.name,
    required this.message,
    required this.time,
    this.isOnline = false, // Default value for isOnline.
    this.isOffline = false, // Default value for isOffline.
    required this.image,
  });
}
