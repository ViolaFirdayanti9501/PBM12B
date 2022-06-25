import 'package:flutter/material.dart';
import 'package:the_kost/screen/main.dart';
import 'package:the_kost/screen/daftar.dart';
import 'package:the_kost/screen/lupa_sandi.dart';
import 'package:the_kost/settings.dart';

class MasukScreen extends StatefulWidget {
  const MasukScreen({Key? key}) : super(key: key);

  @override
  State<MasukScreen> createState() => _MasukScreenState();
}

class _MasukScreenState extends State<MasukScreen> {
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: Color.fromARGB(255, 0, 202, 221),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/kos.png"),
              width: 180,
              height: 180,
            ),
            Expanded(
              flex: 2,
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    formInput(
                      marginTop: 0,
                      marginButton: 0,
                      textValue: 'Nomor Hp atau Email',
                      obscureText: false,
                      checkValidator: (val) {
                        if (val == null) {
                          return 'tidak boleh kosong';
                        }
                        if (val.length < 3) {
                          return 'Minimal 3 karakter';
                        }
                        return null;
                      },
                    ),
                    formInput(
                      marginTop: 20,
                      marginButton: 0,
                      textValue: 'Password',
                      obscureText: true,
                      checkValidator: (val) {
                        if (val == null) {
                          return 'password harus diisi';
                        }
                        if (val.length < 6) {
                          return 'password minimal 6 karakter';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 0, 202, 221)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return LupaScreen();
                      }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Lupa kata sandi ?  ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: mRed),
                        ),
                      ],
                    ),
                  )),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: kDefaultPadding,
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 55,
                                child: ElevatedButton(
                                  child: Text('Masuk'),
                                  onPressed: () {
                                    if (formkey.currentState != null) {
                                      if (formkey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('Berhasil Masuk')));
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_) {
                                            return mainApp();
                                          }));
                                        });
                                      } else {
                                        print(
                                            'Terdapat inputan yang belum valid');
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: mRed,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Container(
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 0, 202, 221)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return DaftarScreen();
                      }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun ?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: mRed),
                        ),
                      ],
                    ),
                  )),
            )
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
