import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool checkliMi = false;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              print(value);
              setState(() {
                text = value;
                checkliMi = value.length.isEven;
              });
            },
          ),
          Checkbox(value: checkliMi, onChanged: makeTrue)
        ],
      )),
    );
  }

  void makeTrue(bool? value) {
    checkliMi = !checkliMi;
    setState(() {});
  }
}
