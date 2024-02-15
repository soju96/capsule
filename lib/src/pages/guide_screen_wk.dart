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
      MaterialPageRoute(builder: (context) => const YourNextScreen()),
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
      appBar: AppBar(actions: [
        IconButton(onPressed: _finishGuide, icon: const Icon(Icons.skip_next))
      ]),
      body: PageView(
        controller: _controller,
        onPageChanged: _onPageChanged,
        children: const [
          GuideContentPage(
            title: 'Page 1',
            description: 'dsdsadas',
            swipeIcon: Icons.abc,
          ),
          GuideContentPage(
            title: 'Page 2',
            description: '쪽지를 작성하여 당신의 행복을 기록하세요.',
            swipeIcon: Icons.abc,
          ),
          GuideContentPage(
            title: 'Page 3',
            description: '유리병은 최대 20개까지 쪽지를 저장 할 수 있습니다.',
            swipeIcon: Icons.abc,
          ),
        ],
      ),
    );
  }
}

class GuideContentPage extends StatelessWidget {
  final String title;
  final String description;
  final IconData swipeIcon;
  final VoidCallback? onFinish;

  const GuideContentPage({
    super.key,
    required this.title,
    required this.description,
    required this.swipeIcon,
    this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
          Icon(
            swipeIcon,
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: onFinish, child: const Text('건너뛰기'))
        ],
      ),
    );
  }
}

class YourNextScreen extends StatelessWidget {
  const YourNextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: const Center(
        child: Text('This is the next screen after the guide.'),
      ),
    );
  }
}
