import 'package:flutter/material.dart';
import 'package:weather_app/app/presentation/widgets/custom_bg_img.dart';

import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_text_field.dart';

class CityPage extends StatelessWidget {
  CityPage({Key key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: CustomBgImg(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                CustomTextFieald(textEditingController: textEditingController),
          ),
          SizedBox(
            height: mediaQuery.height * 0.05,
          ),
          CustomOutlinedButton(
              onPressed: () {
                if (textEditingController.text.isNotEmpty) {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context, textEditingController.text);
                }
              },
              textEditingController: textEditingController),
        ],
      )),
    );
  }
}
