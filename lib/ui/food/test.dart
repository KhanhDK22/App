import 'package:app_food_new/ui/screen_appbar/appbarScreen.dart';
import 'package:app_food_new/ui/screen_appbar/pageFavoriesInItem.dart';
import 'package:flutter/material.dart';

class TESTVIEW extends StatefulWidget {
  const TESTVIEW({super.key});

  @override
  State<TESTVIEW> createState() => _TESTVIEWState();
}

class _TESTVIEWState extends State<TESTVIEW>
    with SingleTickerProviderStateMixin {
  final int _selectedIndex = 0;
  final PageController controller = PageController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppbarScreen(),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(child: FavoriesInItemPage()),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.restart_alt_outlined)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
