import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_plus/share_plus.dart';

import '../../../infra/core/core_exports.dart';


class ReportScreen extends StatelessWidget {
  final File pdfFile;

  ReportScreen({super.key, required this.pdfFile});


  void _onShareWithResult(BuildContext context) async {
   final shareResult = await Share.shareXFiles([XFile(pdfFile.path)]);
   print(shareResult);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Center(
          child: Image.asset(
            AppImages.splashlogo,
            height: 40,
            color: AppColors.white,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            _onShareWithResult(context);
          }, icon: Icon(Icons.share)),
          SizedBox(
            width: 50,
          )
        ],
      ),
      body : PDFView(
        filePath: pdfFile.path,
      )
      // body: FutureBuilder<PDFDocument>(
      //   future: _loadPdfDocument(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else if (snapshot.hasData) {
      //       return PDFViewer(
      //         document: snapshot.data!,
      //       );
      //     } else {
      //       return Center(child: Text('No PDF available'));
      //     }
      //   },
      // ),
    );
  }
}
