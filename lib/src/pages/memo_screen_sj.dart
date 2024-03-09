import 'dart:io';
import 'package:capsule/src/pages/memo_view_page_sj.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class MemoInput extends StatefulWidget {
  const MemoInput({Key? key}) : super(key: key);

  @override
  _MemoInputState createState() => _MemoInputState();
}

class _MemoInputState extends State<MemoInput> {
  final TextEditingController _keywordController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  bool _isSaving = false; // 저장 중인지 여부를 나타내는 상태 변수
  File? _image; // 선택한 이미지 파일

  @override
  void dispose() {
    _keywordController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image != null ? File(image.path) : null;
    });
  }

  Future<void> _saveMemoAndNavigate() async {
    bool shouldSave = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('쪽지 등록'),
          content: const Text('쪽지가 병안으로 들어갑니다. 병안에 들어간 쪽지는 수정 할 수 없습니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // 저장 확인
              },
              child: const Text('예'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // 저장 취소
              },
              child: const Text('아니오'),
            ),
          ],
        );
      },
    );

    if (shouldSave == true) {
      await _saveMemo(); // 메모 저장
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => MemoViewPage()), // 입력한 내용을 보여주는 페이지로 이동
      // );
    }
  }

  Future<void> _saveMemo() async {
    setState(() {
      _isSaving = true; // 저장 중 상태로 변경
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('memo', _contentController.text); // 메모 내용 저장
    await prefs.setString('keyword', _keywordController.text); // 키워드 저장

    String? imageUuid; // 이미지 UUID 초기화

    if (_image != null) {
      // 파일 이름 생성
      String originName = _image!.path.split('/').last;
      String imageUuid = const Uuid().v4().split('-')[0];

      // Firebase Storage에 이미지 업로드
      Reference storage = FirebaseStorage.instanceFor(
              bucket: "gs://happybottle-13b47.appspot.com")
          .ref()
          .child('memory/$imageUuid');
      UploadTask uploadTask =
          storage.putFile(_image!, SettableMetadata(contentType: 'image/jpeg'));
      await uploadTask.whenComplete(() => null);

      // 업로드된 이미지의 다운로드 URL 가져오기
      // String imageUrl = await storageReference.getDownloadURL();
      // await prefs.setString('imageUrl', imageUrl); // 이미지 URL 저장
    }

    // Oracle DB에 저장하기 위해 spring boot로 보내기
    // final response = await http.post(
    //   Uri.parse('https://your-spring-boot-api-url/memos'), // 스프링 부트 주소 넣기
    //   body: {
    //     'keyword': _keywordController.text,
    //     'content': _contentController.text,
    //     'imageUuid': imageUuid ?? '', // 이미지 UUID 또는 빈 문자열 전송
    //   },
    // ); // 일단 이 걸로 spring boot로 보내고 그 다음에

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('저장완료'),
      ),
    );

    setState(() {
      _isSaving = false; // 저장 완료 후 상태 변경
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MemoViewPage(
          keyword: _keywordController.text,
          content: _contentController.text,
          imageUrl: '$imageUuid', // 이미지 URL을 추가해야 함
        ),
      ),
    );
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
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            '쪽지1',
            style: TextStyle(fontFamily: 'seoyoon'),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: _isSaving // 저장 중일 때는 비활성화
                  ? null
                  : _saveMemoAndNavigate, // 저장 함수 호출
              child: Text(
                _isSaving ? '저장중' : '저장', // 저장 중일 때는 '저장중', 그렇지 않으면 '저장'으로 표시
                style: const TextStyle(color: Colors.white),
              ),
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
                    maxLength: 35, // 최대 글자수 35자 제한
                    decoration: const InputDecoration(
                      hintText: '제목을 입력하세요',
                      alignLabelWithHint: true, // 가운데 정렬
                      border: UnderlineInputBorder(), // 밑줄
                    ),
                    maxLines: null, // 1줄이 아닌 밑으로 늘어나게 해줌
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('yyyy.MM.dd').format(DateTime.now()),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                  if (_image != null) // 선택한 이미지가 있을 경우에만 이미지 표시
                    Image.file(_image!),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: const TextStyle(fontSize: 20),
                    controller: _contentController,
                    maxLength: 250, // 최대 글자수 250자
                    decoration: const InputDecoration(
                      hintText: '당신의 행복을 적어주세요.',
                      border: UnderlineInputBorder(), // 밑줄
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _getImage,
                        child: const Text(
                          '이미지 넣기',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
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
