import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aide & Support"),
        backgroundColor: Colors.orange, // Consistant avec le thème
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Assure que le contenu est défilable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image ou bannière en haut pour un look plus professionnel
              Center(
                child: Image.asset(
                  'assets/profile/help.jpg', // Assurez-vous du bon chemin vers l'image
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),

              // Titre pour la section des FAQ
              Text(
                "Questions fréquemment posées",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 15),

              // Articles des FAQ
              _faqItem(
                question: "Comment réinitialiser mon mot de passe ?",
                answer: "Vous pouvez réinitialiser votre mot de passe en allant dans la section 'Paramètres' et en sélectionnant 'Changer de mot de passe'.",
              ),
              _faqItem(
                question: "Comment contacter le support ?",
                answer: "Vous pouvez contacter le support via la section 'Contactez-nous' dans le menu de votre profil.",
              ),
              _faqItem(
                question: "Que faire si je trouve un bug ?",
                answer: "Veuillez signaler le bug via la section 'Aide & Support' et décrire le problème.",
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Méthode d'assistance pour afficher les articles des FAQ
  Widget _faqItem({required String question, required String answer}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              answer,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
