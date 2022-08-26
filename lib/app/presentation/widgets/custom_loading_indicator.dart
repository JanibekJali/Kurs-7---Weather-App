import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final bool isLoading;
  const CustomLoadingIndicator({this.isLoading = false, Key key})
      : super(key: key);
  Widget _loading() {
    if (isLoading == true) {
      return LinearProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.blue,
      );
    } else {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.blue,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loading();
  }
}
