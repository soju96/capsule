import 'package:capsule/src/pages/guide_content_screen_wk.dart';
import 'package:capsule/src/pages/index_screen_wk.dart';
import 'package:capsule/src/pages/mypage_screen_wk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Guide extends StatefulWidget {
  final bool isMyPaged;
  const Guide({super.key, required this.isMyPaged});

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    //_checkIfFirstTime(); // 이미 실행한 적이 있는 경우, 가이드 페이지를 보여주지 않음
  }

  void _checkIfFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (!isFirstTime && widget.isMyPaged == false) {
      _navigateToNextScreen();
    }
  }

  void _navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const IndexScreen()),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _finishGuide() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', false);
    _navigateToNextScreen();
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
                  _finishGuide();
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
