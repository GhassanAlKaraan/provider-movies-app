import 'package:flutter/material.dart';
//ignore: must_be_immutable
class CartButton extends StatelessWidget {
  CartButton({super.key, required this.onTap, required this.counter});

  final Function()? onTap;
  int counter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.indigo,
            ),
            const SizedBox(width: 20,),
            Text(
              "Go to Cart ($counter)",
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            )
          ],
        ),
      ),
    );
  }
}
