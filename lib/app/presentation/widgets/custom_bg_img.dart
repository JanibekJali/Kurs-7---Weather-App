import 'package:flutter/material.dart';

class CustomBgImg extends StatelessWidget {
  final Widget child;
  const CustomBgImg({this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
