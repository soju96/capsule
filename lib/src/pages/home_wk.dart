import 'package:capsule/src/pages/bottle_screen_wk.dart';
import 'package:capsule/src/pages/mypage_screen_wk.dart';
import 'package:capsule/src/pages/shelflist_screen_hj.dart';
import 'package:capsule/src/widgets/base_floating_button_wk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    const ShelfListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _saveNameToSharedPreferences();
    _loadSharedPreferences();
  }

  Future<void> _saveNameToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', 'heji');
  }

  Future<void> _loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    if (name == 'heji') {
      setState(() {
        _selectedIndex = 2;
      });
    } else {
      setState(() {
        _selectedIndex = 0;
      });
    }
  }

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
