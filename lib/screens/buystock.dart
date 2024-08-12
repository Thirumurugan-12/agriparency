import 'package:flutter/material.dart';

class BuyStockPage extends StatefulWidget {
  // BuyStockPage({Key key}) : super(key: key);

  @override
  _BuyStockPageState createState() => _BuyStockPageState();
}

class _BuyStockPageState extends State<BuyStockPage> {
  final TextEditingController batchIdController = TextEditingController();
  final TextEditingController producerAddressController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Stock'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: batchIdController,
              decoration: InputDecoration(
                labelText: 'Batch ID',
              ),
            ),
            TextField(
              controller: producerAddressController,
              decoration: InputDecoration(
                labelText: 'Producer Address',
              ),
            ),
            TextField(
              controller: statusController,
              decoration: InputDecoration(
                labelText: 'Status',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your functionality for buying a stock here
                // You can access the text of the inputs with batchIdController.text, producerAddressController.text, and statusController.text
              },
              child: Text('Confirm Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}