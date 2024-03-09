import 'package:flutter/material.dart';
import 'package:capsule/src/models/memos_hj.dart'; // Memo 클래스 import 필요

class MemoList extends StatelessWidget {
  final List<BottleInfo> bottles; // BottleInfo 리스트를 받아옴

  MemoList({Key? key, required this.bottles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo List'),
      ),
      body: ListView.builder(
        itemCount: bottles.length,
        itemBuilder: (context, index) {
          final bottle = bottles[index];
          return ListTile(
            title: Text('Bottle Number: ${bottle.bNo}'),
            subtitle: Text('Date: ${bottle.bDate}'),
            // 여기서 Bottle의 메모들을 보여줄 수 있음
            onTap: () {
              // Bottle의 메모들을 보여주는 화면으로 이동
              // 예를 들어, Bottle의 메모 리스트를 보여주는 화면으로 이동할 수 있음
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MemoDetailScreen(bottle: bottle)),
              );
            },
          );
        },
      ),
    );
  }
}
