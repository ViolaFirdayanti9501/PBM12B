import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:the_kost/screen/ubah_profil.dart';

class KameraScreen extends StatefulWidget {
  const KameraScreen({Key? key}) : super(key: key);

  @override
  State<KameraScreen> createState() => _KameraScreenState();
}

class _KameraScreenState extends State<KameraScreen> {
  var kamera_ready = false;

  late CameraController _kamController;

  @override
  void initState() {
    super.initState();
    initKamera();
  }

  initKamera() async {
    var kameras = await availableCameras();
    if (kameras.isNotEmpty) {
      // print('jumlah kamera: ${cameras.length}');

      CameraDescription kamera = kameras.first;

      _kamController = CameraController(
        kamera,
        ResolutionPreset.high,
      );

      _kamController.initialize().then((value) {
        setState(() {
          kamera_ready = true;
        });
      });
    }
  }

  @override
  void dispose() {
    _kamController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: _buildKamera(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black),
                child: Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: FloatingActionButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Digunakan')));
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return EditProfileScreen();
                        }));
                      });
                    },
                    child: Icon(Icons.camera,
                        color: Color.fromARGB(255, 0, 202, 221)),
                    backgroundColor: Colors.white,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildKamera() {
    if (kamera_ready == false) {
      return CircularProgressIndicator();
    }
    if (_kamController != null) {
      return CameraPreview(_kamController);
    }
    return Container();
  }
}
