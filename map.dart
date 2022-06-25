import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_kost/settings.dart';
import 'package:the_kost/dialog/pop_pesan.dart';

class mapScreen extends StatefulWidget {
  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctxt) => new messagesDialog(
        icon: Icons.hourglass_bottom,
        text: 'Menunggu Konfirmasi Pesanan',
        isMessage: true,
        isFinal: false,
      ),
    );
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () => show(context));
    return Scaffold(
      backgroundColor: mBlue,
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
