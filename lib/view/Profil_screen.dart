import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/utils/app_colors.dart';

import '../model/User_model.dart';

// Exemple d'utilisateur
final UserModel currentUser = UserModel(
  name: "Ryhab Ruyhab",
  email: "ryhab@example.com",
  profileImage: "https://via.placeholder.com/150",
);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserModel user;

  @override
  void initState() {
    super.initState();
    // Initialiser l'utilisateur avec les données actuelles
    user = currentUser;
  }

  void _editProfile() {
    // Ouvrir une boîte de dialogue pour modifier les données
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nameController =
        TextEditingController(text: user.name);
        final TextEditingController emailController =
        TextEditingController(text: user.email);

        return AlertDialog(
          title: const Text(
            "Edit Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  user.name = nameController.text;
                  user.email = emailController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: korange,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.03),
            // Image de profil
            Center(
              child: CircleAvatar(
                radius: size.width * 0.2,
                backgroundImage: NetworkImage(user.profileImage),
                backgroundColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            // Nom
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kblack,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            // Email
            Text(
              user.email,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            // Ligne de séparation
            Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
            SizedBox(height: size.height * 0.03),
            // Bouton pour modifier le profil
            ListTile(
              leading: const Icon(Icons.edit, color: korange),
              title: const Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: _editProfile,
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: korange),
              title: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Action pour se déconnecter
              },
            ),
          ],
        ),
      ),
    );
  }
}
