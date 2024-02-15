import 'package:capsule/src/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class indexScreen extends StatelessWidget {
  const indexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/memo.png',
                width: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '오늘의 행복을 오래동안',
                style: TextStyle(fontSize: 30),
              ),
              const Text('일상생활에서의 행복을 남기세요.'),
              const SizedBox(
                height: 100,
              ),
              FloatingActionButton.extended(
                  onPressed: () {}, label: const Text('data'))
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
