import 'dart:developer';

import 'package:flutter/material.dart';

class MisalPage extends StatefulWidget {
  const MisalPage({Key key}) : super(key: key);

  @override
  State<MisalPage> createState() => _MisalPageState();
}

class _MisalPageState extends State<MisalPage> {
  String name = 'name kele elek';
  @override
  void initState() {
    getName();
    super.initState();
    log('initState ==> ');
  }

  Future<void> getName() async {
    // log('Get name ==> ');
    try {
      await Future.delayed(Duration(seconds: 3), () {
        name = 'Bul Name 3 secunddan kiyin keldi';
      });
    } catch (katanIyrgit) {
      throw Exception(katanIyrgit);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log('build ==> ');
    return Scaffold(
      body: Center(child: Text(name)),
    );
  }
}
