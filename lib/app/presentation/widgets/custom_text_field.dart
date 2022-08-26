import 'package:flutter/material.dart';

class CustomTextFieald extends StatelessWidget {
  const CustomTextFieald({
    Key key,
    @required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(color: Colors.blue, width: 3.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(color: Colors.green, width: 3.0),
          ),
          hintText: 'Шаардын атын жаз ',
          hintStyle: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}
