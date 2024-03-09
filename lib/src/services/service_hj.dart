import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<bool> checkMemoDataExistence(String id) async {
  final response = await http.get(Uri.parse('http://10.0.2.2/happy-capsule/shelf/jsonlist/$id'));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.isNotEmpty; // 메모 데이터가 존재하는지 여부를 반환
  } else {
    throw Exception('Failed to load memo list');
  }
}

}
