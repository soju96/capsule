import 'package:capsule/src/pages/memo_screen_sj.dart';
import 'package:flutter/material.dart';

class BaseFloatingButton extends StatelessWidget {
  const BaseFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(
        side: BorderSide(style: BorderStyle.solid),
      ),
      backgroundColor: Colors.white,
      onPressed: () {
        // IconButton을 누를 때 MemoInput 위젯으로 화면을 전환합니다.
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MemoInput(),
          ),
        );
      },
      heroTag: "actionButton",
      child: Image.asset(
        'assets/images/pen.png',
        width: 30,
      ),
    );
  }
}
