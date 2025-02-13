import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toplamhesaplama/renkler.dart';

class Toplam extends StatefulWidget {
  const Toplam({super.key});

  @override
  State<Toplam> createState() => _ToplamState();
}

var tfKontrol = TextEditingController();

class _ToplamState extends State<Toplam> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context).size;
    var ekranGenislik = ekranBilgisi.width;
    var ekranYukseklik = ekranBilgisi.height;
    print("Ekran Yükseklik:$ekranYukseklik");
    print("Ekran Genişlik:$ekranGenislik");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Toplam Hesaplayıcı',
          style: TextStyle(fontSize: ekranGenislik / 13),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ekranYukseklik / 4.5,
            ),
            Container(
              height: ekranYukseklik / 8,
              decoration: BoxDecoration(color: Color(cevapRenk)),
              child: TextField(
                controller: tfKontrol,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (veri) {
                  tfKontrol.text = veri;
                },
                style: TextStyle(
                  fontSize: ekranGenislik / 10,
                ),
              ),
            ),
            Container(
              height: ekranYukseklik / 1.91,
              color: Color(soruRenk),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(sayiRenk),
                                  shape: const BeveledRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  fixedSize: Size(42, 70)),
                              onPressed: () {
                                tfKontrol.clear();
                              },
                              child: Text(
                                "C",
                                style: TextStyle(
                                    color: Color(beyazRenk), fontSize: 40),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(sayiRenk),
                                  shape: const BeveledRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  fixedSize: Size(42, 70)),
                              onPressed: () {
                                String mevcutMetin = tfKontrol.text;
                                if (mevcutMetin.isNotEmpty) {
                                  tfKontrol.text = mevcutMetin.substring(
                                      0, mevcutMetin.length - 1);
                                }
                              },
                              child: Text(
                                "X",
                                style: TextStyle(
                                    color: Color(beyazRenk), fontSize: 40),
                              )),
                        ),
                        Sayilar(yazi: "+"),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(sayiRenk),
                                  shape: const BeveledRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  fixedSize: Size(42, 70)),
                              onPressed: () {
                                String text = tfKontrol.text;

                                // '+' işareti etrafında sayıları ayırıyoruz
                                List<String> sayilar = text.split('+');

                                double toplam = 0;
                                for (var sayi in sayilar) {
                                  // Her sayıyı integer'a çeviriyoruz ve toplamaya ekliyoruz
                                  double? sayiDouble = double.tryParse(
                                      sayi.trim()); // boşlukları temizler
                                  if (sayiDouble != null) {
                                    toplam += sayiDouble;
                                  } else {
                                    print("Geçersiz sayı: $sayi");
                                  }
                                }
                                tfKontrol.clear();
                                tfKontrol.text = "$toplam";
                              },
                              child: Text(
                                "=",
                                style: TextStyle(
                                    color: Color(beyazRenk), fontSize: 40),
                              )),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Sayilar(yazi: "9"),
                      Sayilar(yazi: "8"),
                      Sayilar(yazi: "7"),
                      Sayilar(yazi: "6")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Sayilar(yazi: "5"),
                      Sayilar(yazi: "4"),
                      Sayilar(yazi: "3"),
                      Sayilar(yazi: "2")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Sayilar(yazi: "1"),
                      Sayilar(yazi: "0"),
                      Sayilar(yazi: ".")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sayilar extends StatelessWidget {
  String yazi;
  Sayilar({required this.yazi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color(sayiRenk),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              fixedSize: Size(42, 70)),
          onPressed: () {
            tfKontrol.text = "${tfKontrol.text}$yazi";
          },
          child: Text(
            yazi,
            style: TextStyle(color: Color(beyazRenk), fontSize: 40),
          )),
    );
  }
}
