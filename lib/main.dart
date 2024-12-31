import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/provider/cart_provider.dart';
import 'package:flutter_food_delivery_app/view/onboard_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Ensure this import is present
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: ScreenUtilInit(
       // designSize: const Size(375, 812), // Update this size to match your design specs
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const OnboardScreen(),
            builder: (context, widget) {
              // ScreenUtil initialization
              ScreenUtil.init(context);
              return widget!;
            },
          );
        },
      ),
    );
  }
}
