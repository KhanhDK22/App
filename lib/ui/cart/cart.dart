import 'package:app_food_new/data/models/product.dart';
import 'package:app_food_new/ui/cart/widgets/item_cart.dart';
import 'package:app_food_new/utils/extensions/context.dart';
import 'package:app_food_new/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen(
      {super.key, required this.list, required this.callbackUpdateListProduct});
  final List<Product> list;
  final Function(List<Product>) callbackUpdateListProduct;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> defaultList = [];
  bool isCash = true;
  bool isTranfer = false;
  void changedCash(bool? value) {
    if (value != null) {
      isCash = value;
      isTranfer = !value;
      setState(() {});
    }
  }

  void changedTranfer(bool? value) {
    if (value != null) {
      isTranfer = value;
      isCash = !value;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    defaultList = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giỏ hàng"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.list.isEmpty
                ? Container(
                    color: Colors.grey.shade200,
                    height: 100,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "Chưa có sản phẩm nào",
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  )
                : Column(
                    children: widget.list
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: ItemCart(
                                product: e,
                                callbackUpdateProduct: (p0) {
                                  if (p0.quantity == 0) {
                                    defaultList = defaultList..remove(e);
                                  } else {
                                    defaultList[widget.list.indexOf(e)] = p0;
                                  }

                                  setState(() {});
                                  widget.callbackUpdateListProduct
                                      .call(defaultList);
                                },
                              ),
                            ))
                        .toList(),
                  ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text(
                  "Tổng tiền hóa đơn",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  "${widget.list.fold(0.0, (previousValue, element) => previousValue + ((element.price ?? 0) * (element.quantity ?? 0)))}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Phương thức thanh toán",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Checkbox(value: isCash, onChanged: changedCash),
                const Text(
                  "Tiền mặt",
                  style: TextStyle(fontSize: 11),
                ),
                Checkbox(value: isTranfer, onChanged: changedTranfer),
                const Text(
                  "Chuyển khoản",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 30),
            CustomButton(
              title: "Thanh toán",
              onPressed: () {
                context.pop("success");
                context.showSnackBar(
                    content: "Thanh toán thành công", isSuccess: true);
              },
              buttonType: ButtonType.FILL,
            )
          ],
        ),
      ),
    );
  }
}
