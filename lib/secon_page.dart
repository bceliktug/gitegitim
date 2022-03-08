import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool checkliMi = false;
  String text = '';
  String istenenYazi = '';

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
          YaziYeri(istenenYazi: istenenYazi),
          Checkbox(value: checkliMi, onChanged: makeTrue),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  istenenYazi = 'sifir';
                });
              },
              child: Text('0'))
        ],
      )),
    );
  }

  void makeTrue(bool? value) {
    checkliMi = !checkliMi;
    setState(() {});
  }
}

class YaziYeri extends StatefulWidget {
  final istenenYazi;
  const YaziYeri({
    Key? key,
    required this.istenenYazi,
  }) : super(key: key);

  @override
  State<YaziYeri> createState() => _YaziYeriState();
}

class _YaziYeriState extends State<YaziYeri> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      print('yeni değer: ${controller.text}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void didUpdateWidget(covariant YaziYeri oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.istenenYazi != widget.istenenYazi) {
      controller.text = widget.istenenYazi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            controller.text = '';
          },
        ),
      ),
    );
  }
}
