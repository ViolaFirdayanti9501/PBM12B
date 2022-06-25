import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:the_kost/settings.dart';
import 'package:the_kost/screen/detail.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({Key? key}) : super(key: key);

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              color: Color.fromARGB(255, 0, 202, 221),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset("assets/kos.png"),
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(height: 1),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Cari kos disini",
                      prefixIconColor: Colors.grey,
                      prefixStyle: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: mGraywhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Lagi cari apa?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      BoxCard(
                        'assets/images0.png',
                        'Kamar Kos Bebas',
                        'Jl. Sulawesi 7 Jember',
                        '600.000',
                      ),
                      BoxCard(
                        'assets/images1.png',
                        'Kamar Kos Pria',
                        'Jl. Sulawesi 2 Jember',
                        '400.000',
                      ),
                      BoxCard(
                        'assets/images2.png',
                        'Kamar Kos Putri',
                        'Jl. Jawa 6 Jember',
                        '500.000',
                      ),
                      BoxCard(
                        'assets/images3.png',
                        'Kamar Kos Bebas',
                        'Jl. Kalimantan 5 Jember ',
                        '350.000',
                      ),
                      BoxCard(
                        'assets/images4.png',
                        'Kamar Kos Bebas',
                        'Jl. Sumatera 12 Jember',
                        '330.000',
                      ),
                      BoxCard(
                        'assets/images5.png',
                        'Kamar Kos Bebas',
                        'Jl. Riau 9 Jember',
                        '300.000',
                      ),
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

  Container BoxCard(image, nama, stock, harga) {
    return Container(
      height: 95,
      width: 380,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: Image.asset(image),
          ),
          Container(
            height: 70,
            width: 165,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    nama,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    stock,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Color.fromARGB(255, 180, 180, 180),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    harga,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Future.delayed(Duration(seconds: 0), () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return DetailScreen();
                }));
              });
            },
            child: Container(
              height: 70,
              width: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 30,
                    width: 30,
                    child: Icon(
                      Icons.favorite,
                      color: mGray,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                        color: mRed, borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Sewa',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
