import 'package:capsule/src/models/bottle_hj.dart';
import 'package:flutter/material.dart';

class MemoPage extends StatelessWidget {
  final BottleInfo bottleInfo;

  const MemoPage({super.key, required this.bottleInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${bottleInfo.bNo}번 선반'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('bNo: ${bottleInfo.bNo}'),
          Text('bDate: ${bottleInfo.bDate}'),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: bottleInfo.memos.length,
              itemBuilder: (context, index) {
                final memo = bottleInfo.memos[index];
                return ListTile(
                  title: Text('Memo ${memo.mNo}'),
                  subtitle: Text(memo.mText),
                  leading: memo.mPic != null ? Image.network(memo.mPic!) : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
