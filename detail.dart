import 'package:flutter/material.dart';
import 'package:the_kost/dialog/pop_sewa.dart';
import 'package:the_kost/screen/map.dart';
import 'package:the_kost/settings.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset("assets/images0.png"),
                    width: 300,
                    height: 300,
                  ),
                ],
              ),
            ),
            Container(
              height: 415,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: mGraywhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Kamar Kos Bebas',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: mGraywhite,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Menu('Alamat     :  Jl. Sulawesi 7 Jember'),
                            Menu('Ukuran     :  4 x 4'),
                            Menu('Fasilitas   :  Kasur, Lemari'),
                            Menu('Harga       :  600.000 / bulan'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => mapScreen(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: 400,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Image.asset(
                        'map.jpg',
                        width: 400,
                        height: 400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 65,
              width: MediaQuery.of(context).size.width,
              color: mBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pop_sewa(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: mRed, borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'Sewa',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container Menu(text) {
    text;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}
