import 'package:flutter/material.dart';

class Transaction {
  final String transactionId;
  final String stockName;
  final DateTime transactionDate;

  Transaction({required this.transactionId, required this.stockName, required this.transactionDate});
}

class TransactionPage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(transactionId: '1', stockName: 'Rice', transactionDate: DateTime.now()),
    // Add more transactions here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(transactions[index].stockName),
                subtitle: Text('Transaction ID: ${transactions[index].transactionId}\nDate: ${transactions[index].transactionDate}'),
              ),
            );
          },
        ),
      ),
    );
  }
}