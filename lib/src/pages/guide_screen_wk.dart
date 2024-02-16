import 'package:capsule/src/pages/home_screen_wk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _checkIfFirstTime();
  }

  void _checkIfFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (!isFirstTime) {
      // 이미 실행한 적이 있는 경우, 가이드 페이지를 보여주지 않음
      _navigateToNextScreen();
    }
  }

  void _navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
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
          IconButton(onPressed: _finishGuide, icon: const Icon(Icons.close))
          // TextButton(
          //   onPressed: _finishGuide,
          //   child: const Text('건너뛰기', style: TextStyle(color: Colors.black)),
          // )
        ],
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: _onPageChanged,
        children: const [
          GuideContentPage(
            imgName: 'assets/images/memo.png',
            description: '쪽지를 작성하여 당신의 행복을 기록하세요.',
          ),
          GuideContentPage(
            imgName: 'assets/images/bottle.png',
            description: '유리병은 최대 20개까지 쪽지를 저장 할 수 있습니다.',
          ),
        ],
      ),
    );
  }
}

class GuideContentPage extends StatelessWidget {
  final String imgName;
  final String description;
  final VoidCallback? onFinish;

  const GuideContentPage({
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
