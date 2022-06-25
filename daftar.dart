import 'package:flutter/material.dart';
import 'package:the_kost/screen/main.dart';
import 'package:the_kost/settings.dart';

class DaftarScreen extends StatefulWidget {
  const DaftarScreen({Key? key}) : super(key: key);

  @override
  State<DaftarScreen> createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 0, 202, 221),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 202, 221),
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
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/kos.png"),
              width: 180,
              height: 180,
            ),
            Expanded(
              flex: 8,
              child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      formInput(
                        marginTop: 0,
                        marginButton: 20,
                        textValue: 'Nama',
                        obscureText: false,
                        checkValidator: (val) {
                          if (val == null) {
                            return 'Tidak Boleh Kosong';
                          }
                          if (val.length < 3) {
                            return 'Minimal 3 karakter';
                          }
                          return null;
                        },
                      ),
                      formInput(
                        marginTop: 0,
                        marginButton: 20,
                        textValue: 'Email',
                        obscureText: false,
                        checkValidator: (val) {
                          if (val == null) {
                            return 'Tidak Boleh Kosong';
                          }
                          if (val.length < 9) {
                            return 'Minimal 9 karakter';
                          }
                          return null;
                        },
                      ),
                      formInput(
                        marginTop: 0,
                        marginButton: 20,
                        textValue: 'Nomor Telepon',
                        obscureText: true,
                        checkValidator: (val) {
                          if (val == null) {
                            return 'Tidak Boleh Kosong';
                          }
                          if (val.length < 11) {
                            return 'Minimal 11 karakter';
                          }
                          return null;
                        },
                      ),
                      formInput(
                        marginTop: 0,
                        marginButton: 20,
                        textValue: 'Password',
                        obscureText: true,
                        checkValidator: (val) {
                          if (val == null) {
                            return 'Tidak Boleh Kosong';
                          }
                          if (val.length < 6) {
                            return 'Minimal 6 karakter';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
            ),
            Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                      child: Text('Daftar'),
                      onPressed: () {
                        if (formkey.currentState != null) {
                          if (formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Berhasil Daftar')));
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return mainApp();
                              }));
                            });
                          } else {
                            print('Inputan belum valid');
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: mRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class formInput extends StatelessWidget {
  final String textValue;
  final bool obscureText;
  final double marginTop;
  final double marginButton;
  final String? Function(String?)? checkValidator;

  const formInput({
    required this.textValue,
    required this.obscureText,
    required this.marginTop,
    required this.marginButton,
    this.checkValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: marginTop, bottom: marginButton),
          child: TextFormField(
            key: GlobalKey<FormState>(),
            controller: TextEditingController(),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: textValue,
            ),
            autofocus: false,
            obscureText: obscureText,
            validator: checkValidator,
          )),
    );
  }
}
