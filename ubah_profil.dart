import 'package:flutter/material.dart';
import 'package:the_kost/dialog/pop_gambar.dart';
import 'package:the_kost/screen/kamera.dart';
import 'package:the_kost/screen/profil.dart';
import 'package:the_kost/settings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 202, 221),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'Ubah Profil',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 0),
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Berhasil disimpan')));
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return ProfilScreen();
                    }));
                  });
                },
                child: Container(
                  height: 30,
                  margin: EdgeInsets.only(left: 0),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                      color: mRed, borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 360,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => popGambar(),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromARGB(255, 0, 202, 221),
                      ),
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              width: 350,
              alignment: Alignment.center,
              child: Text('Ubah Foto'),
            ),
            customFieldEdit(
              labelText: 'Nama',
              top: 25,
            ),
            customFieldEdit(
              labelText: 'Jenis Kelamin',
              top: 20,
            ),
            customFieldEdit(
              labelText: 'Tanggal Lahir',
              top: 20,
            ),
            customFieldEdit(
              labelText: 'Alamat',
              top: 20,
            ),
            customFieldEdit(
              labelText: 'Email',
              top: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class customFieldEdit extends StatelessWidget {
  final String labelText;
  final double top;

  const customFieldEdit({
    required this.labelText,
    required this.top,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      margin: EdgeInsets.only(top: top),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Text(
                  labelText,
                  style: TextStyle(color: Color.fromARGB(170, 0, 0, 0)),
                ),
                Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
          TextFormField(
            autofocus: false,
          )
        ],
      ),
    );
  }
}
