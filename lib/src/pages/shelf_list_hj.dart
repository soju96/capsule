import 'package:flutter/material.dart';
import 'package:capsule/src/models/bottle_hj.dart';
import '../services/service_hj.dart';

class JsonParse extends StatefulWidget {
  const JsonParse({super.key});

  @override
  State<JsonParse> createState() => JsonParseState();
}

class JsonParseState extends State<JsonParse> {
  List<CapsuleList> _capsulelist = <CapsuleList>[];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Services.getInfo().then((value) {
      setState(() {
        _capsulelist = value;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? 'bottle' : 'Loading'),
      ),
      body: ListView.builder(
        itemCount: _capsulelist.length,
        itemBuilder: (context, index) {
          CapsuleList capsule = _capsulelist[index];
          return ListTile(
            leading: const Icon(
              Icons.account_circle_rounded,
              color: Colors.blue,
            ),
            trailing: const Icon(
              Icons.phone_android_outlined,
              color: Colors.red,
            ),
            title: Text(capsule.uId),
            subtitle: Text(capsule.bDate.toString()),
          );
        },
      ),
    );
  }
}
