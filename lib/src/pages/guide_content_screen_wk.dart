import 'package:flutter/material.dart';

class GuideContentScreen extends StatelessWidget {
  final String imgName;
  final String description;
  final VoidCallback? onFinish;

  const GuideContentScreen({
    super.key,
    required this.imgName,
    required this.description,
    this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgName,
            height: 300,
          ),
          const SizedBox(height: 50),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
