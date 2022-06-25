import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:the_kost/settings.dart';

import 'detail.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 202, 221),
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'List',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 10,
              width: 340,
              child: Row(
                children: [],
              ),
            ),
            Wrap(
              children: [
                BoxCard(
                  'assets/images0.png',
                  'Kamar Kos Bebas',
                  'Jl. Sulawesi 7 Jember',
                  'Tersisa : 0 Hari',
                ),
                BoxCard(
                  'assets/images1.png',
                  'Kamar Kos Pria',
                  'Jl. Sulawesi 2 Jember',
                  'Tersisa : 0 Hari',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container BoxCard(image, nama, alamat, harga) {
    return Container(
      height: 95,
      width: 360,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: mGraywhite, borderRadius: BorderRadius.circular(5)),
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
            width: 160,
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
                    alamat,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Color.fromARGB(255, 180, 180, 180),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, top: 15),
                  child: Text(
                    harga,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: mRed,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Future.delayed(Duration(seconds: 1), () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return DetailScreen();
                }));
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 25,
              width: 90,
              decoration: BoxDecoration(
                  color: mRed, borderRadius: BorderRadius.circular(5)),
              child: Text(
                'Sewa Lagi',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
