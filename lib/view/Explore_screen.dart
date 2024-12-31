import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/utils/app_colors.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Static data for example
    final List<Map<String, String>> exploreItems = [
      {"name": "Pizza", "image": "assets/ramen/fullset_ramen.png"},
      {"name": "Burgers", "image": "assets/burger/fried-chicken-burger.png"},
      {"name": "Sushi", "image": "assets/burger/fried-chicken-burger.png"},
      {"name": "Pasta", "image": "assets/ramen/fullset_ramen.png"},
      {"name": "Salads", "image": "assets/ramen/fullset_ramen.png"},
      {"name": "Desserts", "image": "assets/burger/fried-chicken-burger.png"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: korange,
        title: const Text(
          "Explore",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: exploreItems.length,
          itemBuilder: (context, index) {
            final item = exploreItems[index];
            return GestureDetector(
              onTap: () {
                // Action when an item is clicked
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(item["name"]!),
                    content: const Text("Explore details for this item."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Item image
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          item["image"]!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Item name
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item["name"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kblack,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
