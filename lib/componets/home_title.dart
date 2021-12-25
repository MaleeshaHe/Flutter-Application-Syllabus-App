import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Bindumathi',
          fontSize: 28,
          color: Color(0xFF545D68),
          fontWeight: FontWeight.bold,
        ),
      ),
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 2000),
      curve: Curves.easeIn,
      builder: (BuildContext context, double _val, child) {
        return Opacity(
          opacity: _val,
          child:
              Padding(padding: EdgeInsets.only(top: _val * 20), child: child),
        );
      },
    );
  }
}
