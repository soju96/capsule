// 홈 눌렀을때 넘어오는 페이지
import 'package:flutter/material.dart';

class ShelfList extends StatelessWidget {
  const ShelfList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/bottle.png',
                          width: 300,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/bottle.png',
                      width: 300,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      'assets/images/bottle.png',
                      width: 300,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      'assets/images/bottle.png',
                      width: 300,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      'assets/images/bottle.png',
                      width: 300,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      'assets/images/bottle.png',
                      width: 300,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      'assets/images/bottle.png',
                      width: 300,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      'assets/images/bottle.png',
                      width: 300,
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/shelf.png')
            ],
          ),
        ));
  }
}
