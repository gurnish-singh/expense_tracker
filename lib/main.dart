import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/userTransaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
          style: TextStyle(
            fontSize: 23,
            fontWeight:FontWeight.bold,

          ),
        ),
        backgroundColor: Colors.purple[200],
        actions: <Widget>[
          //it takes a list of widgets
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, //enum
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ////////////////// weekly thing///////////////////////
            Card(
              color: Colors.purple[100],
              child: Container(
                //width of the card depends on the container;
                width: double.infinity,
                child: Text(
                  'hello',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                margin: EdgeInsets.all(10),
              ),
            ),
            ////////////////////////transation input field + transaction details //////////////////////////////
            UserTransaction(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Colors.purple[200],
      ),
    );
  }
}
