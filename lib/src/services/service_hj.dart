import 'package:http/http.dart' as http;
import 'package:capsule/src/models/bottle_hj.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Services {
  static const String url = "http://localhost/happy-capsule/shelf/jsonlist/ran";

  static Future<List<CapsuleList>> getInfo() async {
    try {
      final response = await http.post(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<CapsuleList> capsulelist =
            capsuleListFromJson(response.body);
        return capsulelist;
      } else {
        Fluttertoast.showToast(msg: 'Error !!!!');
        return <CapsuleList>[];
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return <CapsuleList>[];
    }
  }
}
