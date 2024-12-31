import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/utils/app_colors.dart';

import '../model/user_model.dart';
import 'ContactUsScreen.dart';
import 'HelpScreen.dart';

// Exemple d'utilisateur
final UserModel currentUser = UserModel(
  name: "Ryhab Ruyhab",
  email: "ryhab@example.com",
  profileImage: "assets/profile/profile.jpeg", // Utilisation des assets
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
    user = currentUser;
  }

  void _editProfile() {
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
          content: SingleChildScrollView(
            child: Column(
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

  void _changeProfilePicture() {
    print("Change profile picture");
  }

  void _changePassword() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController currentPasswordController =
        TextEditingController();
        final TextEditingController newPasswordController =
        TextEditingController();

        return AlertDialog(
          title: const Text(
            "Change Password",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: currentPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Current Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "New Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
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
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _changeLanguage() {
    print("Change language");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              // Image de fond de profil (optionnelle)
              Container(
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: korange,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: _changeProfilePicture,
                    child: CircleAvatar(
                      radius: size.width * 0.2,
                      backgroundImage: AssetImage(user.profileImage),
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              // Nom et Email
              Text(
                user.name,
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: kblack,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                user.email,
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: size.height * 0.03),
              Divider(color: Colors.grey[400], thickness: 1),
              SizedBox(height: size.height * 0.03),
              // Section "A propos" (bio)
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 5),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.edit, color: korange, size: size.width * 0.07),
                      title: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: _editProfile,
                    ),
                    ListTile(
                      leading: Icon(Icons.help, color: korange, size: size.width * 0.07),
                      title: Text(
                        "Help & Support",
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HelpScreen()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_mail, color: korange, size: size.width * 0.07),
                      title: Text(
                        "Contact Us",
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContactUsScreen()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.language, color: korange, size: size.width * 0.07),
                      title: Text(
                        "Change Language",
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: _changeLanguage,
                    ),
                    ListTile(
                      leading: Icon(Icons.lock, color: korange, size: size.width * 0.07),
                      title: Text(
                        "Change Password",
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: _changePassword,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
