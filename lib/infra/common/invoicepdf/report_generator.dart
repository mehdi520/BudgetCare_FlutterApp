import 'package:budget_care/data/models/income/data_models/income_page_model.dart';
import 'package:budget_care/infra/common/common_export.dart';
import 'package:budget_care/infra/common/invoicepdf/pdf_helper.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

class ReportGenerator{
  static Future<Uint8List> _loadLogo() async {
    final ByteData data = await rootBundle.load('assets/images/logo2.png');
    return data.buffer.asUint8List();
  }

  static Future<File> generate(IncomePageModel invoice,String name,String email,String title,String titleDescription) async {
    final pdf = Document();
    final Uint8List logoData = await _loadLogo();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(name,email,logoData),
        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle(title,titleDescription),
        buildInvoice(invoice),
        Divider(),
        buildTotal(invoice.totalAmount.toString()),
      ],
      footer: (context) => buildFooter(),
    ));

    return PdfHelper.saveDocument(name: 'BudgetCare_Report.pdf', pdf: pdf);
  }

  static Widget buildHeader( String name,String email,Uint8List logoData) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 1 * PdfPageFormat.cm),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // buildSupplierAddress(invoice.supplier),
          pw.Image(
            pw.MemoryImage(logoData),
            width: 100,
            height: 100,
          ),
          Container(
            height: 50,
            width: 50,
            child: BarcodeWidget(
              barcode: Barcode.qrCode(),
              data: "https://mehdibalti.com",
            ),
          ),
        ],
      ),
      SizedBox(height: 1 * PdfPageFormat.cm),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCustomerAddress(name,email),
        ],
      ),
    ],
  );

  static Widget buildCustomerAddress(String name,String email) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      Text(email),
    ],
  );
  static Widget buildTitle(String title,String description) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 0.8 * PdfPageFormat.cm),
      Text(description),
      SizedBox(height: 0.8 * PdfPageFormat.cm),
    ],
  );

  static Widget buildInvoice(IncomePageModel invoice) {
    final headers = [
      'Date',
      'Description',
      'Amount'
    ];
    final data = invoice.data.map((item) {
      final date = DateTime.parse(item.date);

      return [
        DateUtil.formatDisplayDate(date),
        item.description,
        item.amount.toStringAsFixed(2)
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(String total) {

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Net total',
                  value: total,
                  unite: true,
                ),
                Divider(),
                buildText(
                  title: 'Total amount',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: total,
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter() => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Divider(),
      SizedBox(height: 2 * PdfPageFormat.mm),
      Text('Budget Care,Street 09,Blue Area, Islamabad Pakistan'),
    ],
  );
  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}