import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/utils/app_colors.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Données statiques pour l'exemple
    final List<Map<String, String>> messages = [
      {
        "name": "John Doe",
        "lastMessage": "Hey, are you available?",
        "time": "10:45 AM",
        "profileImage": "https://via.placeholder.com/150"
      },
      {
        "name": "Jane Smith",
        "lastMessage": "Thanks for your help!",
        "time": "9:30 AM",
        "profileImage": "https://via.placeholder.com/150"
      },
      {
        "name": "Restaurant ABC",
        "lastMessage": "Your order is ready for pickup.",
        "time": "Yesterday",
        "profileImage": "https://via.placeholder.com/150"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: korange,
        title: const Text(
          "Messages",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: messages.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final message = messages[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(message["profileImage"]!),
              radius: 28,
            ),
            title: Text(
              message["name"]!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              message["lastMessage"]!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            trailing: Text(
              message["time"]!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            onTap: () {
              // Naviguer vers l'écran de conversation détaillée
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(userName: message["name"]!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final String userName;

  const ChatScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: korange,
        title: Text(userName),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Chat details will appear here.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
