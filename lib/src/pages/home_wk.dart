import 'package:capsule/src/models/bottle_hj.dart';
import 'package:capsule/src/pages/bottle_screen_wk.dart';
import 'package:capsule/src/pages/shelf_list_hj.dart';
import 'package:capsule/src/pages/mypage_screen_wk.dart';
import 'package:capsule/src/services/service_hj.dart';

import 'package:capsule/src/widgets/base_floating_button_wk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key, required String id});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  

  final List<Widget> _pages = [
    BottleScreen(),
    const MyPageScreen(),
     MemoList()
  ];

  @override
  void initState() {
    super.initState();
   
    _loadSharedPreferences();
  }


  Future<void> _loadSharedPreferences() async {
    bool memoDataExists = await HttpService.checkMemoDataExistence(id);

          if (memoDataExists) {
            // 메모 데이터가 존재하면 MemoList 페이지로 이동
            setState(() {
        _selectedIndex = 2;
      });
          } else {
            // 메모 데이터가 존재하지 않으면 BottleScreen 페이지로 이동
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
