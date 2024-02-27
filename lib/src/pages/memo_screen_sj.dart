import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

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

  Future<void> _saveMemo() async {
    setState(() {
      _isSaving = true; // 저장 중 상태로 변경
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('memo', _contentController.text); // 메모 내용 저장
    await prefs.setString('keyword', _keywordController.text); // 키워드 저장

    if (_image != null) {
      // 파일 이름 생성
      String originName = _image!.path.split('/').last;
      String uuid = const Uuid().v4();
      String shortUuid = uuid.split('-')[0]; // '-'로 나눈 후 첫 번째 부분만 사용
      String saveName =
          '$shortUuid${originName.substring(originName.lastIndexOf("."))}';

      // Firebase Storage에 이미지 업로드
      Reference storage = FirebaseStorage.instanceFor(
              bucket: "gs://happybottle-13b47.appspot.com")
          .ref()
          .child('memory/$saveName');
      UploadTask uploadTask =
          storage.putFile(_image!, SettableMetadata(contentType: 'image/jpeg'));
      await uploadTask.whenComplete(() => null);

      // 업로드된 이미지의 다운로드 URL 가져오기
      // String imageUrl = await storageReference.getDownloadURL();
      // await prefs.setString('imageUrl', imageUrl); // 이미지 URL 저장
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('저장완료'),
      ),
    );

    setState(() {
      _isSaving = false; // 저장 완료 후 상태 변경
    });
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
                  : _saveMemo, // 저장 함수 호출
              child: Text(
                _isSaving ? '완료' : '저장', // 저장 중일 때는 '완료', 그렇지 않으면 '저장'으로 표시
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
                    maxLength: 100, // 최대 글자수 100자 제한
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
                      hintText: '당신의 행복을 적어주세요',
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
                        child: const Text('이미지 넣기'),
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
