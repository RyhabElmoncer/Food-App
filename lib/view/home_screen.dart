import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/categories_model.dart';
import '../model/products_model.dart';
import '../provider/cart_provider.dart';
import '../view/cart_screen.dart';
import '../widgets/food_products_item.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String category = "";
  List<MyProductModel> productModel = [];

  @override
  void initState() {
    super.initState();
    if (myCategories.isNotEmpty) {
      category = myCategories[0].name;
      filterProductByCategory(category);
    }
  }

  void filterProductByCategory(String selectedCategory) {
    setState(() {
      category = selectedCategory;
      productModel = myProductModel
          .where((element) =>
      element.category.toLowerCase() == selectedCategory.toLowerCase())
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05;
    final cartProvider = Provider.of<CartProvider>(context);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text("Tunis ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black45,
                                fontWeight: FontWeight.w600,
                              )),
                          Icon(Icons.keyboard_arrow_down, color: kblack),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        children: [
                          Icon(Icons.location_on, color: korange),
                          SizedBox(width: 5),
                          Text("Tunis",
                              style: TextStyle(
                                fontSize: 16,
                                color: kblack,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(size.width * 0.02),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.search, color: kblack),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartScreen()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(size.width * 0.02),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: kblack,
                            ),
                          ),
                        ),
                        if (cartProvider.carts.isNotEmpty)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.all(size.width * 0.015),
                              decoration: const BoxDecoration(
                                color: Color(0xfff95f60),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                cartProvider.carts.length.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: const Text(
              "Découvrez les meilleurs plats !",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: -.4,
                color: kblack,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Find by Category",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600, color: kblack)),
                Text("See All", style: TextStyle(color: korange)),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: myCategories
                  .map((cat) => GestureDetector(
                onTap: () {
                  filterProductByCategory(cat.name);
                },
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: category == cat.name
                        ? Border.all(width: 2.5, color: korange)
                        : Border.all(color: Colors.white),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        cat.image,
                        width: size.width * 0.1,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        cat.name,
                        style: const TextStyle(
                          color: kblack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ))
                  .toList(),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              "Result (${productModel.length})",
              style: TextStyle(
                color: kblack.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                letterSpacing: -.2,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: productModel
                  .map(
                    (prod) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: FoodProductItems(productModel: prod),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
