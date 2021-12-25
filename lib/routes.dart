import 'package:al_syllabus_app/componets/pdfview.dart';
import 'package:al_syllabus_app/pages/home.dart';
import 'package:al_syllabus_app/pages/maths.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (_) => const Home(),
  Maths.routeName: (_) => const Maths(),
  PdfView.routeName: (_) => const PdfView(),
};
