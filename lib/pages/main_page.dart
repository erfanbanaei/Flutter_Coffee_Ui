import 'package:coffeeapp/pages/card_page.dart';
import 'package:coffeeapp/pages/favorite_page.dart';
import 'package:coffeeapp/pages/history_page.dart';
import 'package:coffeeapp/pages/home_page.dart';
import 'package:coffeeapp/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndexBottomNavigationBar = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexBottomNavigationBar = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndexBottomNavigationBar = index;
          });
        },
        children: const [
          HomePage(),
          CardPage(),
          FavoritePage(),
          HistoryPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndexBottomNavigationBar,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
