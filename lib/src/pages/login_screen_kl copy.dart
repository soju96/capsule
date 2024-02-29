// import 'package:capsule/src/pages/home_wk.dart';
// import 'package:capsule/src/pages/search_account_screen_kl.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // 로그인 API 엔드포인트 URL
// const String loginUrl = 'http://10.0.2.2/happy-capsule/login';
// final TextEditingController idController = TextEditingController();
// final TextEditingController pwController = TextEditingController();

// class LogInScreen extends StatelessWidget {
//   const LogInScreen({super.key});

//   // 아이디와 비밀번호를 가지고 로그인 요청을 보내는 함수
//   Future<void> loginRequest(context, String id, String pw) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$loginUrl?u_id=$id&u_pw=$pw'),
//         // body: jsonEncode(<String, String>{
//         //   'u_id': id,
//         //   'u_pw': pw,
//         // }),
//         // headers: <String, String>{
//         //   'Content-Type': 'application/json; charset=UTF-8',
//         // },
//       );

//       print(response.body.toString());

//       if (response.statusCode == 200) {
//         // 서버 응답 확인
//         // Map<String, dynamic> responseData = jsonDecode(response.body);
//         // bool success = responseData['success'];
//         // String message = responseData['message'];

//         if (response.body.toString() == '1') {
//           // 로그인 성공
//           // 메인 화면으로 이동
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const Home()),
//           );
//         } else {
//           // 로그인 실패
//           // 오류 메시지 표시
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("로그인 실패"),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       } else {
//         // 서버 요청 실패
//         // 에러 처리
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('서버 요청 실패'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       // 네트워크 오류 등 예외 처리
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 '오늘의 행복은 무엇인가요?',
//                 style: TextStyle(fontSize: 30),
//               ),
//               const SizedBox(
//                 height: 100,
//               ),
//               TextFormField(
//                 controller: idController, // 아이디 입력란에 controller 할당
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   hintText: '아이디',
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: pwController, // 비밀번호 입력란에 controller 할당
//                 textAlign: TextAlign.center,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: '비밀번호',
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   String id = idController.text; // 아이디 값 가져오기
//                   String pw = pwController.text; // 비밀번호 값 가져오기
//                   print(id);
//                   print(pw);
//                   loginRequest(context, id, pw); // 로그인 요청 보내기
//                   // Navigator.pushReplacement(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //       builder: (context) => const Home(),
//                   //     ));
//                 },
//                 child: Text(
//                   '로그인',
//                   style: TextStyle(
//                       fontSize: 18, color: Theme.of(context).primaryColor),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => const SearchAccountScreen()));
//                 },
//                 child: Text(
//                   '아이디 / 비밀번호 찾기',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
