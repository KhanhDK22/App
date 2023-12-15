import 'package:app_food_new/data/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap});
  final Product product;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(1, 1),
              blurRadius: 2,
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          if (product.imagePath != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(
                  product.imagePath ?? "",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.productName ?? ""),
              Text(
                product.price?.toString() ?? "",
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: const Text(
              "Thêm vào giỏ hàng +",
              style: TextStyle(color: Colors.pink, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
