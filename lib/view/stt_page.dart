import 'package:flutter/material.dart';

import 'component/sttwidget.dart';

class SttPage extends StatelessWidget {
  const SttPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("着順入力"),
        centerTitle: true,
      ),
      body: Container(
        child: SttWidget(),
      ),
    );
  }
}
