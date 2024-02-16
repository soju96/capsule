import 'package:flutter/material.dart';

class MemoInput extends StatefulWidget {
  const MemoInput({super.key});

  @override
  State<MemoInput> createState() => _MemoInputState();
}

class _MemoInputState extends State<MemoInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          '쪽지1',
          style: TextStyle(fontFamily: 'seoyoon'),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('여기에 이제 메모지를 만들어 넣겠습니다..')],
        ),
      ),
    );
  }
}
