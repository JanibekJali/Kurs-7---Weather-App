import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomOutlinedButton({
    this.onPressed,
    Key key,
    @required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: const Color.fromARGB(255, 112, 110, 110),
          primary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
      onPressed: onPressed,
      child: const Text(
        'Шаарды изде',
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}
