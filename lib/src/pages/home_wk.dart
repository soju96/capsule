import 'package:capsule/src/pages/bottle_screen_wk.dart';
import 'package:capsule/src/pages/mypage_screen_wk.dart';
import 'package:capsule/src/widgets/base_floating_button_wk.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BottleScreen(),
    const MyPageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton:
          _selectedIndex == 0 ? null : const BaseFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Opacity(
              opacity: _selectedIndex == 0 ? 1.0 : 0.5,
              child: IconButton(
                onPressed: () {
                  _onItemTapped(0);
                },
                icon: Image.asset(
                  'assets/images/clover.png',
                ),
              ),
            ),
            Opacity(
              opacity: _selectedIndex == 1 ? 1.0 : 0.5,
              child: IconButton(
                onPressed: () {
                  _onItemTapped(1);
                },
                icon: Image.asset(
                  'assets/logos/user.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
