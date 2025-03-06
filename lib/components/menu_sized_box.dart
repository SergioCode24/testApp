import 'package:flutter/cupertino.dart';

class MenuSizedBox extends StatelessWidget {
  const MenuSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Меню',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
