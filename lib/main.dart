/////////packages//////////////////////
import 'package:flutter/material.dart';
//////files/////////////////////////
import 'package:expense_tracker/widgets/newTransaction.dart';
import 'widgets/transactionList.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',    
        textTheme:ThemeData.light().textTheme.copyWith(   ///////my own theme
                title: TextStyle(
                  fontFamily: 'Quicksand',   // eh apply houga for the rest of the app
                  fontSize: 18,      /////ethe mene theme nu define kita transaction list ch appply kita
                  fontWeight: FontWeight.bold,
                ),
              ),
        appBarTheme: AppBarTheme(    ////to apply text theme for every app bar on every page
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /////////initial list of transactions//////////////////
  final List<Transaction> transactions = [       /// baad de vich transactions deleate krtia si
    //Transaction( 
      //id: 't1',
     // title: 'New shoes',
   //   amount: 50,
     // date: DateTime.now(),
    //),
   // Transaction(
     // id: 't2',
      //title: 'Groceries',
     // amount: 40,
      //date: DateTime.now(),
    //),
  ];
  ////////////function for button of addNewTransaction///////////////////
  void addNew(String title, double amount) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(), //temporary
    );
    // now we need to add it to the parent transaction list;
    setState(() {
      transactions.add(newTx);
    });
  }

  ////////////////to bring up text fields for adding new transactions////////////////////////////////
  void start(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bctx) {
        ///bctx is dummy not using that
        return NewTransaction(addNew);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple[200],
        actions: <Widget>[
          //it takes a list of widgets
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {
              start(context);
            },
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
            //////////////////////// transaction details //////////////////////////////
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          start(context);
        },
        backgroundColor: Colors.purple[200],
      ),
    );
  }
}
