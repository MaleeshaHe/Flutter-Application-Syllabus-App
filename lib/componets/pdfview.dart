import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfViewArguments {
  final String link;
  final String subject;

  PdfViewArguments({required this.link, required this.subject});
}

class PdfView extends StatefulWidget {
  static const routeName = '/pdfview';
  const PdfView({Key? key}) : super(key: key);

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    final PdfViewArguments args =
        ModalRoute.of(context)?.settings.arguments as PdfViewArguments;

    loadDocument() async {
      try {
        PDFDocument document;
        document = await PDFDocument.fromURL(args.link);
        return document;
      } catch (e) {
        // print(e);
      }
    }

    return FutureBuilder(
      future: loadDocument(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              centerTitle: true,
              leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios, color: Color(0xFF545D68)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                args.subject,
                style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(
                    0xFF545D68,
                  ),
                ),
              ),
            ),
            body: PDFViewer(
              document: snapshot.data,
              lazyLoad: false,
              scrollDirection: Axis.vertical,
              zoomSteps: 5,
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF545D68)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: const Text(
              'Loading...',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(
                  0xFF545D68,
                ),
              ),
            ),
          ),
          body: const Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromRGBO(250, 245, 228, 1),
            ),
          ),
        );
      },
    );
  }
}
