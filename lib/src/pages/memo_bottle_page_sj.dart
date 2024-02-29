import 'package:capsule/src/pages/memo_view_page_sj.dart';
import 'package:flutter/material.dart';

class MemoBottlePage extends StatefulWidget {
  const MemoBottlePage({Key? key}) : super(key: key);

  @override
  _MemoBottlePageState createState() => _MemoBottlePageState();
}

class _MemoBottlePageState extends State<MemoBottlePage> {
  final List<String> memos = List.generate(20, (index) => '메모 ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: const Text('1번째 저금통'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center, // 이미지가 화면의 가운데로 이동하도록 설정
          children: [
            Image.asset(
              'assets/images/empty_uncap_bottle.png',
              width: 700,
            ),
            Padding(
              padding: const EdgeInsets.all(45.0),
              child: Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 70.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: memos.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MemoViewPage(
                            keyword: '키워드 ${index + 1}',
                            content: '콘텐츠 ${index + 1}',
                            imageUrl: '이미지 URL ${index + 1}',
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(),
                        child: Image.asset(
                          'assets/images/memo.png',
                          width: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
