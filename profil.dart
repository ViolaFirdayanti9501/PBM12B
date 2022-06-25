import 'package:flutter/material.dart';
import 'package:the_kost/screen/ubah_profil.dart';
import 'package:the_kost/screen/alamat.dart';
import 'package:the_kost/settings.dart';
import 'package:the_kost/dialog/pop_hapus.dart';
import 'package:the_kost/screen/masuk.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 202, 221),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'Profil',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10.0),
              child: TextButton(
                onPressed: () {
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return EditProfileScreen();
                    }));
                  });
                },
                child: Container(
                  height: 30,
                  margin: EdgeInsets.only(left: 30),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                      color: mRed, borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      // margin: EdgeInsets.all(100.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 202, 221),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                        height: 10,
                      ),
                      Menu('Viola Firdayanti'),
                      Menu('Perempuan'),
                      Menu('20 Juli 2002'),
                      Menu('Situbondo-Jawa Timur'),
                      Menu('202410102005@mail.unej.ac.id'),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Berhasil Keluar')));
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return MasukScreen();
                  }));
                });
              },
              child: Container(
                height: 70,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 140,
                      decoration: BoxDecoration(
                          color: mRed, borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'Keluar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
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
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 0, 0, 0.4),
          fontSize: 12,
        ),
      ),
    );
  }
}
