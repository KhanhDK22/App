import 'package:app_food_new/data/models/product.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  const ItemCart(
      {super.key, required this.product, required this.callbackUpdateProduct});
  final Product product;
  final Function(Product) callbackUpdateProduct;

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  Product product = const Product();
  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  void addMore() {
    product =
        widget.product.copyWith(quantity: (widget.product.quantity ?? 0) + 1);
    widget.callbackUpdateProduct.call(product);

  }

  void remove() {
    product =
        widget.product.copyWith(quantity: (widget.product.quantity ?? 1) - 1);
    widget.callbackUpdateProduct.call(product);
 
  }

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
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(widget.product.productName ?? ""),
              Text(
                "Giá tiền: ${widget.product.price?.toStringAsFixed(2) ?? ""}",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Row(
                children: [
                  GestureDetector(onTap: addMore, child: const Icon(Icons.add)),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(3)),
                    child: Text(widget.product.quantity?.toString() ?? ""),
                  ),
                  GestureDetector(
                      onTap: remove, child: const Icon(Icons.remove)),
                ],
              ),
              Text(
                "Thành tiền: ${(widget.product.price ?? 0) * (widget.product.quantity ?? 0)}",
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
