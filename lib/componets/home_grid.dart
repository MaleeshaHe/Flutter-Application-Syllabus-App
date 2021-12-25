import 'package:al_syllabus_app/pages/maths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 445.0,
            child: GridView.count(
              crossAxisCount: 3,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 1,
              children: <Widget>[
                _buildCard('Maths sub', '.Ks;h', ' ', 'assets/images/2.png',
                    true, false, context),
                _buildCard('Bio Science', 'Ôj úoHdj', ' ',
                    'assets/images/3.png', false, true, context),
                _buildCard('Technology', ';dlaIKfõoh', ' ',
                    'assets/images/5.png', false, false, context),
                _buildCard('Commerce', 'jdKsc', ' ', 'assets/images/4.png',
                    false, false, context),
                _buildCard('Art', 'l,d', ' ', 'assets/images/1.png', false,
                    false, context),
                _buildCard('Commen', 'fmdÿ úIhka', ' ', 'assets/images/6.png',
                    false, false, context),
              ],
            ),
          ),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String database, String name, String price, String imgPath,
      bool added, bool isFavorite, context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            Maths.routeName,
            arguments: MathsArguments(
              databasepath: database,
              subjetname: name,
              image: imgPath,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Bindumathi',
                  fontSize: 16.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: const Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
