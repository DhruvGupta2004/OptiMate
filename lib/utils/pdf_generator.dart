import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/cart_item_model.dart';

class PDFGenerator {
  static Future<void> generateBillPDF(String name, String phone, List<CartItem> cart, double total) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Customer: $name\nPhone: $phone'),
          pw.SizedBox(height: 10),
          ...cart.map((item) => pw.Text('${item.name} x${item.quantity} - ₹${item.price * item.quantity}')),
          pw.Divider(),
          pw.Text('Total: ₹$total'),
        ],
      ),
    ));

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
