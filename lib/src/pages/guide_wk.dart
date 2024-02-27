import 'package:capsule/src/pages/guide_content_screen_wk.dart';
import 'package:capsule/src/pages/index_screen_wk.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Guide extends StatefulWidget {
  final bool isMyPaged;
  const Guide({super.key, required this.isMyPaged});

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        actions: [
          IconButton(
              onPressed: () {
                if (widget.isMyPaged == true) {
                  Navigator.pop(context);
                } else {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const IndexScreen()),
                  );
                }
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: _onPageChanged,
              children: const [
                GuideContentScreen(
                  imgName: 'assets/images/memo.png',
                  description: '쪽지를 작성하여 당신의 행복을 기록하세요.',
                ),
                GuideContentScreen(
                  imgName: 'assets/images/bottle.png',
                  description: '유리병에 최대 20개까지 쪽지를 저장 할 수 있습니다.',
                ),
                GuideContentScreen(
                  imgName: 'assets/images/bottle_20.png',
                  description: '유리병에 쪽지가 차면 유리병을 열어서 담겨진 쪽지를 읽을 수 있습니다.',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                      color: index == _currentPage
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
