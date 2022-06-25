import 'package:flutter/material.dart';
import 'package:the_kost/screen/main.dart';
import 'package:the_kost/screen/sandi_baru.dart';
import 'package:the_kost/settings.dart';

class LupaScreen extends StatefulWidget {
  const LupaScreen({Key? key}) : super(key: key);

  @override
  State<LupaScreen> createState() => _LupaScreenState();
}

class _LupaScreenState extends State<LupaScreen> {
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
              margin: EdgeInsets.only(
                top: 50,
                bottom: 10,
                left: 10,
                right: 10,
              ),
            ),
            Expanded(
              flex: 3,
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    formInput(
                      marginTop: 20,
                      marginButton: 0,
                      textValue: 'Kode Verifikasi',
                      obscureText: true,
                      checkValidator: (val) {
                        if (val == null) {
                          return 'Kode harus diisi';
                        }
                        if (val.length < 6) {
                          return 'Kode minimal 6 karakter';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
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
                                  child: Text('Verifikasi'),
                                  onPressed: () {
                                    if (formkey.currentState != null) {
                                      if (formkey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('Terverifikasi')));
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_) {
                                            return BaruScreen();
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
