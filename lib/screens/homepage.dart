// lib/homepage.dart
import 'package:agriparency/screens/viewpage.dart';
import 'package:flutter/material.dart';

class Stock {
  final String name;
  final String details;
  final String place;

  Stock({required this.name, required this.details, required this.place});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Stock> stocks = [
    Stock(name: 'Rice', details: 'Long Grain', place: 'Thailand'),
    Stock(name: 'Wheat', details: 'Hard Red', place: 'USA'),
    Stock(name: 'Corn', details: 'Yellow Corn', place: 'USA'),
    Stock(name: 'Barley', details: 'Malting', place: 'Australia'),
    Stock(name: 'Soybeans', details: 'Non-GMO', place: 'Brazil'),
    Stock(name: 'Oats', details: 'Whole Oat Groats', place: 'Canada'),
    Stock(name: 'Rye', details: 'Winter Rye', place: 'Germany'),
    Stock(name: 'Maida', details: 'Refined Wheat Flour', place: 'India'),
    Stock(name: 'Sorghum', details: 'Red Sorghum', place: 'USA'),
    Stock(name: 'Millet', details: 'Pearl Millet', place: 'India'),
    // Add more stocks here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: stocks.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StockViewPage(
                      name: stocks[index].name,
                      details: stocks[index].details,
                      place: stocks[index].place,
                    ),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text(stocks[index].name),
                  subtitle:
                      Text('${stocks[index].details}, ${stocks[index].place}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
