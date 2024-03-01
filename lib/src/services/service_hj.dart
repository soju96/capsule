import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<List<Map<String, dynamic>>> fetchMemoData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/happy-capsule/shelf/jsonlist/ran'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(jsonList);
    } else {
      throw Exception('Failed to load memo list');
    }
  }
}
