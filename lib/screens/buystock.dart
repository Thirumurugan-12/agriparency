import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BuyStockPage extends StatefulWidget {
  // BuyStockPage({Key key}) : super(key: key);

  @override
  _BuyStockPageState createState() => _BuyStockPageState();
}

class _BuyStockPageState extends State<BuyStockPage> {
  final TextEditingController batchIdController = TextEditingController();
  final TextEditingController producerAddressController =
      TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> createBatch() async {
    final response = await http.post(
      Uri.parse('https://3b4f-117-254-39-20.ngrok-free.app/create_batch'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'batch_id': batchIdController.text,
        'producer': producerAddressController.text,
        'status': statusController.text,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      Map<String, dynamic> result = jsonDecode(response.body);
      print('Transaction hash: ${result['transaction_hash']}');
      print('Receipt to: ${result['receipt_to']}');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Transaction Successful'),
            content: Text('Transaction is successful and pushed in market\n\nTransaction hash: ${result['transaction_hash']}\nReceipt to: ${result['receipt_to']}',
                style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      print(response.body);
      throw Exception('Failed to create batch.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                createBatch();
              },
              child: Text('Confirm Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}
