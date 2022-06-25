import 'package:flutter/material.dart';
import 'package:the_kost/screen/beranda.dart';
import 'package:the_kost/screen/list.dart';
import 'package:the_kost/screen/favorit.dart';
import 'package:the_kost/screen/profil.dart';
import 'package:the_kost/settings.dart';

class mainApp extends StatefulWidget {
  const mainApp({Key? key}) : super(key: key);

  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  int pageIndex = 0;

  final pages = [
    const BerandaScreen(),
    const ListScreen(),
    const FavoritScreen(),
    const ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageIndex == 0 ? mBlue : mGraywhite,
      body: Container(
        width: double.infinity,
        child: pages[pageIndex],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 202, 221),
          boxShadow: [
            BoxShadow(
              color: mGray,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            pageIndex == 0
                ? BotNavIcon(0, Icons.home, 'Beranda', mRed)
                : BotNavIcon(0, Icons.home, 'Beranda', mGraywhite),
            pageIndex == 1
                ? BotNavIcon(1, Icons.list, 'List', mRed)
                : BotNavIcon(1, Icons.list, 'List', mGraywhite),
            pageIndex == 2
                ? BotNavIcon(2, Icons.favorite, 'Favorit', mRed)
                : BotNavIcon(2, Icons.favorite, 'Favorit', mGraywhite),
            pageIndex == 3
                ? BotNavIcon(3, Icons.person, 'Profil', mRed)
                : BotNavIcon(3, Icons.person, 'Profil', mGraywhite),
          ],
        ),
      ),
    );
  }

  GestureDetector BotNavIcon(
    index,
    IconData icon,
    text,
    color,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pageIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
