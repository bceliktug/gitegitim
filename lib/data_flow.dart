import 'package:flutter/material.dart';

class DataFlow extends StatefulWidget {
  const DataFlow({Key? key}) : super(key: key);

  @override
  State<DataFlow> createState() => _DataFlowState();
}

class _DataFlowState extends State<DataFlow> {
  var sinif = 5;
  var baslik = 'Öğrenciler';
  var ogrenciler = ['Ali', 'Ayşe', 'Can'];

  void yeniOgrenciEkle(String yeniOgrenci) {
    setState(() {
      ogrenciler.add(yeniOgrenci);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo Page')),
      body: Sinif(
          sinif: sinif,
          baslik: baslik,
          ogrenciler: ogrenciler,
          yeniOgrenciEkle: yeniOgrenciEkle),
    );
  }
}

class Sinif extends StatelessWidget {
  const Sinif(
      {Key? key,
      required this.sinif,
      required this.baslik,
      required this.ogrenciler,
      required this.yeniOgrenciEkle})
      : super(key: key);

  final int sinif;
  final String baslik;
  final List<String> ogrenciler;
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text(
              '$sinif, Sınıf',
              textScaleFactor: 2,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
            ),
          ],
        ),
        Text(
          '$baslik',
          textScaleFactor: 1.5,
        ),
        OgrenciListesi(ogrenciler: ogrenciler),
        OgrenciEkleme(yeniOgrenciEkle: yeniOgrenciEkle)
      ],
    );
  }
}

class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({
    Key? key,
    required this.ogrenciler,
  }) : super(key: key);

  final List<String> ogrenciler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final o in ogrenciler) Text(o),
      ],
    );
  }
}

class OgrenciEkleme extends StatefulWidget {
  const OgrenciEkleme({Key? key, required this.yeniOgrenciEkle})
      : super(key: key);
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  @override
  State<OgrenciEkleme> createState() => _OgrenciEklemeState();
}

class _OgrenciEklemeState extends State<OgrenciEkleme> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
            controller: controller,
            onChanged: (value) {
              setState(() {});
            }),
        ElevatedButton(
            onPressed: controller.text.isEmpty
                ? null
                : () {
                    final yeniOgrenci = controller.text;
                    widget.yeniOgrenciEkle(yeniOgrenci);
                    controller.text = '';
                  },
            child: Text('Ekle')),
      ],
    );
  }
}
