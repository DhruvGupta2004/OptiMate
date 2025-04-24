import 'package:flutter/material.dart';
import '../../models/cart_item_model.dart';
import '../../models/staff_model.dart';
import '../../utils/pdf_generator.dart';

class BillingScreen extends StatefulWidget {
  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  List<CartItem> cart = [];
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  void addToCart() {
    setState(() {
      cart.add(CartItem(name: 'Frame X', price: 1000, quantity: 1)); // Demo
    });
  }

  void generateBill() async {
    final total = cart.fold<double>(0, (sum, item) => sum + item.price * item.quantity);
    await PDFGenerator.generateBillPDF(nameCtrl.text, phoneCtrl.text, cart, total);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("PDF Generated")));
  }

  @override
  Widget build(BuildContext context) {
    final staff = ModalRoute.of(context)!.settings.arguments as Staff;

    return Scaffold(
      appBar: AppBar(title: Text("POS - ${staff.name}")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Customer Name")),
            TextField(controller: phoneCtrl, decoration: InputDecoration(labelText: "Phone Number")),
            ElevatedButton(onPressed: addToCart, child: Text("Add Frame X")),
            Expanded(
              child: ListView(
                children: cart.map((item) => ListTile(
                  title: Text('${item.name} x${item.quantity}'),
                  trailing: Text('₹${item.price * item.quantity}'),
                )).toList(),
              ),
            ),
            ElevatedButton(onPressed: generateBill, child: Text("Generate Bill (PDF)")),
          ],
        ),
      ),
    );
  }
}
