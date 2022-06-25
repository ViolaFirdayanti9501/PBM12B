import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:the_kost/settings.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({Key? key}) : super(key: key);

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
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
              'Favorit',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                ],
              ),
            ],
          ),
        ));
  }

  Container BoxCard(image, nama, alamat, harga) {
    return Container(
      height: 90,
      width: 340,
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
            width: 170,
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.favorite,
                    color: mRed,
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
          )
        ],
      ),
    );
  }

  BottomNavigationBarItem Test(
    IconData icon,
    text,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: text,
    );
  }
}
