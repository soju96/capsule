import 'package:capsule/src/models/bottle_hj.dart';
import 'package:capsule/src/widgets/memo_page_hj.dart';
import 'package:flutter/material.dart';

class MemoList extends StatelessWidget {
  final List<BottleInfo> bottleList = [];

  MemoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Memo List',
          style: TextStyle(color: Colors.black),
        ),
        // actions: [
        //   DropdownButton(
        //     items: bottleList
        //         .map((bottleInfo) => DropdownMenuItem(
        //               value: bottleInfo,
        //               child: Text('${bottleInfo.bNo}번 선반'),
        //             ))
        //         .toList(),
        //     onChanged: (BottleInfo? selectedBottle) {
        //       if (selectedBottle != null) {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => MemoPage(bottleInfo: selectedBottle),
        //           ),
        //         );
        //       }
        //     },
        //   ),
        // ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bottleList.length,
        itemBuilder: (context, index) {
          final BottleInfo bottleInfo = bottleList[index];
          String imagePath = '';
          if (bottleInfo.memos.length <= 5) {
            imagePath = 'assets/images/bottle_5.png';
          } else if (bottleInfo.memos.length <= 10) {
            imagePath = 'assets/images/bottle_10.png';
          } else if (bottleInfo.memos.length <= 15) {
            imagePath = 'assets/images/bottle_15.png';
          } else if (bottleInfo.memos.length <= 19) {
            imagePath = 'assets/images/bottle_19.png';
          } else {
            imagePath = 'assets/images/bottle_20.png';
          }
          return Container(
            width: 200,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath),
                const SizedBox(height: 8),
                Text('b_date: ${bottleInfo.bDate}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
