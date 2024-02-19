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
                  'assets/images/empty_uncap_bottle.png',
                  width: 300,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      '당신의 첫 행복을 적금하세요.',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/pen.png', width: 35),
                      ),
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
