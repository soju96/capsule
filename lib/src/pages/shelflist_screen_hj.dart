import 'package:flutter/material.dart';

class ShelfListScreen extends StatefulWidget {
  const ShelfListScreen({super.key});

  @override
  State<ShelfListScreen> createState() => _ShelfListScreenState();
}

class _ShelfListScreenState extends State<ShelfListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'ㅎㅎ',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Image.asset(
                //   'assets/images/memo.png',
                //   width: 70,
                // ),
                Image.asset(
                  'assets/images/bottle.png',
                  width: 300,
                ),
                const Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      '당신의 첫 행복을 적금하세요.',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )
              ],
            ),
            Image.asset('assets/images/shelf.png'),
          ],
        ),
      ),
    );
  }
}
