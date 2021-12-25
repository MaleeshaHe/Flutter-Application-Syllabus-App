import 'package:al_syllabus_app/componets/home_grid.dart';
import 'package:al_syllabus_app/componets/home_title.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = "/Home";
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Color(0xFF545D68)),
          onPressed: () {},
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(
              0xFF545D68,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/homebg2.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SizedBox(height: 25),
            ScreenTitle(text: " "),
            SizedBox(height: 70),
            ScreenTitle(text: "Wiia fm, úIh Odrdjka"),
            Flexible(
              child: HomeGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
