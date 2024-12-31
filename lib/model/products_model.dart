class MyProductModel {
  final String image, name, category;
  final double price, rate, distance;

  MyProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.category,
    required this.distance,
  });
}

List<MyProductModel> myProductModel = [
  MyProductModel(
    image: 'assets/ramen/sapporo_miso_ramen.png',
    name: 'Spaghetti',
    price: 3.9,
    rate: 5,
    distance: 150,
    category: "Soupe",
  ),
  MyProductModel(
    image: 'assets/ramen/kurume_ramen.png',
    name: 'coscous',
    price: 4.3,
    rate: 4.9,
    distance: 600,
    category: "Soupe",
  ),
  MyProductModel(
    image: 'assets/ramen/hakata_ramen.png',
    name: 'Sushi',
    price: 3.9,
    distance: 400,
    rate: 4.8,
    category: "Soupe",
  ),
  MyProductModel(
    image: 'assets/ramen/shrimp_fried_rice.png',
    name: 'Crevette',
    price: 4.9,
    distance: 800,
    rate: 4.5,
    category: "Soupe",
  ),
  MyProductModel(
    image: 'assets/ramen/fullset_ramen.png',
    name: 'plat',
    price: 5.9,
    distance: 400,
    rate: 4.7,
    category: "Soupe",
  ),
  //for burger
  MyProductModel(
    image: 'assets/burger/grilled-beef-burger.png',
    name: ' beef burger',
    price: 33.5,
    distance: 150,
    rate: 5.0,
    category: "Burger",
  ),
  MyProductModel(
    image: 'assets/burger/fried-chicken-burger.png',
    name: ' Chicken Burger',
    price: 23.0,
    distance: 150,
    rate: 4.7,
    category: "Burger",
  ),
  MyProductModel(
    image: 'assets/burger/cheese-burger.png',
    name: 'Cheese Burger',
    price: 40.5,
    distance: 100,
    rate: 4.5,
    category: "Burger",
  ),
  MyProductModel(
    image: 'assets/burger/beef-burger.png',
    name: 'Beef-Burger',
    price: 18.5,
    distance: 200,
    rate: 5.0,
    category: "Burger",
  ),

  // for salad
  MyProductModel(
    image: 'assets/veg-salad.png',
    name: 'Salad',
    price: 7.0,
    distance: 300,
    rate: 5.0,
    category: "Salad",
  ),
  MyProductModel(
    image: 'assets/mix-salad.png',
    name: 'Mix Salad',
    price: 10.0,
    distance: 350,
    rate: 4.8,
    category: "Salad",
  ),
  // for waffle
  MyProductModel(
    image: 'assets/berry-bonanza-waffle.png',
    name: 'Dessert',
    price: 10.0,
    distance: 500,
    rate: 4.5,
    category: "Dessert",
  ),
];
