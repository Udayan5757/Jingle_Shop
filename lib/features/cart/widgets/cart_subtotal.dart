import 'package:flutter/material.dart';
import 'package:jingle_shop/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CartSubTotal extends StatelessWidget {
  const CartSubTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart!
        .map(
          (e) => sum+= ((e['quantity'] == null ? 0 : e['quantity'] as int))*e['product']['price'] as int)
        .toList();
    int intSum = sum.round().toInt();
    return Container(
      margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Text(
              'Subtotal',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              ' \$$intSum',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
    );
  }
}
