import 'package:capsule/src/widgets/base_floating_button_wk.dart';
import 'package:flutter/material.dart';

class BottleScreen extends StatelessWidget {
  const BottleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          '님의 행복 저금통',
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
                    // Container(
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     border: Border.all(
                    //       color: Theme.of(context).primaryColor,
                    //     ),
                    //   ),
                    //   child: IconButton(
                    //     onPressed: () {},
                    //     icon: const Icon(
                    //       Icons.add,
                    //       size: 50,
                    //     ),
                    //     color: Theme.of(context).primaryColor,
                    //   ),
                    // ),
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
