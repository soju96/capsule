import 'package:flutter/material.dart';

class MemoViewPage extends StatelessWidget {
  final String keyword;
  final String content;
  final String imageUrl; // 이미지 URL을 받아올 수 있도록 추가

  const MemoViewPage({
    Key? key,
    required this.keyword,
    required this.content,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              keyword,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // 이미지를 보여주는 위젯 추가 (imageUrl을 사용하여 이미지를 가져옴)
            // 예시: Image.network(imageUrl),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
