import 'package:budget_care/infra/common/invoicepdf/pdf_helper.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'dart:typed_data';

import 'package:printing/printing.dart';

class SimpleReportGenerator {


  static Future<File> generateSimpleReport() async {
    final pdf = pw.Document(
    );
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [

            pw.SizedBox(height: 20),
            pw.Text("Simple PDF Report",style: pw.TextStyle(font: font, fontSize: 40)),
            pw.SizedBox(height: 10),
            pw.Text("This is a basic test page for PDF generation.",style: pw.TextStyle(font: font, fontSize: 40)),
          ],
        ),
      ),
    );
    return PdfHelper.saveDocument(name: 'BudgetCare_Report.pdf', pdf: pdf);
  }
}
