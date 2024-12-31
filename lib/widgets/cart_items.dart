import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/model/cart_model.dart';
import 'package:flutter_food_delivery_app/provider/cart_provider.dart';
import 'package:flutter_food_delivery_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final CartModel cart;
  const CartItems({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.18,
      width: size.width * 0.85,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.height * 0.16,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            top: -5,
            left: 0,
            child: Transform.rotate(
              angle: 10 * pi / 180,
              child: SizedBox(
                height: size.height * 0.16,
                width: size.width * 0.3,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: kblack.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      cart.productModel.image,
                      width: size.width * 0.3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.4,
            right: size.width * 0.05,
            top: size.height * 0.02,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.productModel.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kblack,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: kyellow,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          cart.productModel.rate.toString(),
                          style: TextStyle(
                            color: kblack.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: kpink,
                          size: 20,
                        ),
                        Text(
                          "${cart.productModel.distance}m",
                          style: TextStyle(
                            color: kblack.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\dt${(cart.productModel.price).toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: kblack,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (cart.quantity > 1) {
                              cartProvider.recuceQuantity(cart.productModel);
                            }
                          },
                          child: Container(
                            width: size.width * 0.05,
                            height: size.height * 0.03,
                            decoration: const BoxDecoration(
                              color: kblack,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(7),
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          cart.quantity.toString(),
                          style: const TextStyle(
                            color: kblack,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            cartProvider.addCart(cart.productModel);
                          },
                          child: Container(
                            width: size.width * 0.05,
                            height: size.height * 0.03,
                            decoration: const BoxDecoration(
                              color: kblack,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(7),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
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
        ],
      ),
    );
  }
}
