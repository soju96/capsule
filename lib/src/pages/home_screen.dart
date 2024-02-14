import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          '님의 행복 저금통',
          style: TextStyle(fontFamily: 'seoyoon'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bottle.png',
              width: 300,
            ),
            Image.asset('assets/images/shelf.png')
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/clover.png'),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: FloatingActionButton(
                onPressed: () {},
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/logos/user.png'),
            )
          ],
        ),
      ),
    );
  }
}
//