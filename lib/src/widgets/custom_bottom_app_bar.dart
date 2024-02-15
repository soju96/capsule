import 'package:capsule/src/pages/memo_screen_sj.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/clover.png'),
          ),
          Transform.translate(
            offset: const Offset(0, -30),
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
                color: Theme.of(context).canvasColor,
              ),
              child: IconButton(
                onPressed: () {
                  // IconButton을 누를 때 MemoInput 위젯으로 화면을 전환합니다.
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MemoInput(),
                  ));
                },
                icon: Image.asset('assets/images/pen.png'),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/logos/user.png'),
          ),
        ],
      ),
    );
  }
}
