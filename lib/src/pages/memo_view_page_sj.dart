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
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('1번째 저금통'),
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
            if (imageUrl.isNotEmpty) // 이미지 URL이 비어있지 않은 경우에만 표시
              Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width, // 이미지 너비를 화면 너비로 설정
                fit: BoxFit.cover, // 이미지가 찌그러지지 않도록 화면에 맞게 조정
              ),
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
