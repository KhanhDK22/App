import 'package:app_food_new/data/models/product.dart';
import 'package:app_food_new/mocks/product.dart';
import 'package:app_food_new/ui/cart/cart.dart';
import 'package:app_food_new/ui/products/widgets/card.dart';
import 'package:app_food_new/utils/extensions/context.dart';
import 'package:app_food_new/utils/routers/app_path.dart';
import 'package:app_food_new/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> list = [];
  List<Product> productSelected = [];

  void onSearch(String? val) {
    list = list
        .where((element) => element.productName!.contains(val ?? ''))
        .toList();
    if (val == null || val.trim().isEmpty) {
      list = productsList;
    }
    setState(() {});
  }

  void onAddToCart(Product product) {
    var existed = productSelected
        .any((element) => element.productName == product.productName);
    if (existed) {
      var value = productSelected
          .firstWhere((element) => element.productName == product.productName);
      productSelected[productSelected.indexOf(value)] =
          product.copyWith(quantity: (value.quantity ?? 0) + 1);
    } else {
      productSelected.add(product.copyWith(quantity: 1));
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    list = productsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              var result = await context.showBottomSheet(
                child: CartScreen(
                  list: productSelected,
                  callbackUpdateListProduct: (val) {
                    productSelected = val;
                    setState(() {});
                  },
                ),
              );
              if (result != null) {
                productSelected.clear();
                setState(() {});
              }
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          Text(
            "${productSelected.fold(0, (previousValue, element) => previousValue + (element.quantity ?? 0))}   ",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Colors.purple.shade400,
        title: const Text(
          "Danh sách sản phẩm",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            CustomTextField(
              onChanged: onSearch,
              borderType: BorderType.OUTLINE,
              hintText: "Tìm kiếm sản phẩm theo tên",
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ProductCard(
                  onTap: () => onAddToCart(list[index]),
                  product: list[index],
                ),
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600,
                offset: const Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 2)
          ],
          color: Colors.white,
        ),
        child: GestureDetector(
          onTap: () => context.go(AppPath.init),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Đăng xuất  ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.pink,
                ),
              ),
              Icon(
                Icons.logout,
                color: Colors.pink,
              )
            ],
          ),
        ),
      ),
    );
  }
}
