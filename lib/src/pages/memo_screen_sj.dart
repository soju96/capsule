import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoInput extends StatefulWidget {
  const MemoInput({super.key});

  @override
  _MemoInputState createState() => _MemoInputState();
}

class _MemoInputState extends State<MemoInput> {
  final TextEditingController _keywordController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _keywordController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 배경을 터치했을 때 포커스 해제하여 키보드가 내려가도록 함
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white, // 전체 배경색을 흰색으로 설정
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            '쪽지1',
            style: TextStyle(fontFamily: 'seoyoon'),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () async {
                // 작성 버튼을 눌렀을 때의 동작
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('memo', _contentController.text); // 메모 내용 저장
                prefs.setString('keyword', _keywordController.text); // 키워드 저장

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('저장되었습니다'),
                  ),
                );
              },
              child: const Text('저장', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            // 배경을 터치했을 때 포커스 해제하여 키보드가 내려가도록 함
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _keywordController,
                    textAlign: TextAlign.center, // 가운데 정렬
                    maxLength: 100, // 최대 글자수 100자 제한
                    decoration: const InputDecoration(
                      hintText: '키워드를 입력하세요',
                      alignLabelWithHint: true, // 가운데 정렬
                      border: UnderlineInputBorder(), // 밑줄
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('yyyy.MM.dd').format(DateTime.now()),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: const TextStyle(fontSize: 20),
                    controller: _contentController,
                    maxLength: 250, // 최대 글자수 250자
                    decoration: const InputDecoration(
                      hintText: '당신의 행복을 적어주세요',
                      border: UnderlineInputBorder(), // 밑줄
                    ),
                    maxLines: null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
