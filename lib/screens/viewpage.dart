import 'package:agriparency/screens/buystock.dart';
import 'package:flutter/material.dart';




class StockViewPage extends StatelessWidget {
  final String name;
  final String details;
  final String place;

  StockViewPage({required  this.name, required  this.details , required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Details: ${details}', style: TextStyle(fontSize: 24)),
              Text('Place: ${place}', style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your functionality for buying a stock here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyStockPage(),
                    ),
                  );
                },
                child: Text('Buy Stock'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement your functionality for checking a hash here
                },
                child: Text('Check Hash'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}