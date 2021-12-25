import 'package:al_syllabus_app/componets/pdfview.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MathsArguments {
  final String databasepath;
  final String subjetname;
  final String image;

  MathsArguments(
      {required this.databasepath,
      required this.subjetname,
      required this.image});
}

class Maths extends StatefulWidget {
  static const routeName = "/Maths";
  const Maths({
    Key? key,
  }) : super(key: key);

  @override
  State<Maths> createState() => _MathsState();
}

class _MathsState extends State<Maths> {
  @override
  Widget build(BuildContext context) {
    final MathsArguments args =
        ModalRoute.of(context)?.settings.arguments as MathsArguments;

    final databaseRef = FirebaseDatabase.instance
        .reference()
        .child("path")
        .child(args.databasepath);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(
              0xFF545D68,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          args.subjetname,
          style: const TextStyle(
            fontFamily: 'Bindumathi',
            fontSize: 20.0,
            color: Color(
              0xFF545D68,
            ),
          ),
        ),
      ),
      body: FirebaseAnimatedList(
        query: databaseRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 5.0,
              left: 50.0,
              right: 50.0,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  PdfView.routeName,
                  arguments: PdfViewArguments(
                    link: snapshot.value['url'],
                    subject: snapshot.value['subject'],
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
                      blurRadius: 5.0,
                    )
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [SizedBox(height: 15.0)],
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(args.image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      snapshot.value['subject'],
                      style: const TextStyle(
                        color: Color(0xFF575E67),
                        fontFamily: 'Varela',
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
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
        },
      ),
    );
  }
}
