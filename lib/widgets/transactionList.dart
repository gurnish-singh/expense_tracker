import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(
      this.transactions); //constructor to intialize (eh transactions baahr toh aungia taan appan nu constructor initialize karna pau)
  // this is a common technique u can also pass functions
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // both listview and listview.builder can be used
      //listview initializes every vlaue to be rendered
      //listview.builder only initializes those which are currently on the screen
      child: transactions
              .isEmpty //// je transaction empty hai taan iik image display krani hai
          ? Column(
              children: <Widget>[
                Text(
                  'no transaction added yet', //pehla text print kravage
                  style: Theme.of(context)
                      .textTheme
                      .title, // theme appan ne ohi rakhni hai
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  /// image nu appan nu container de naal wrap karna pau
                  height: 200,

                  /// kyoki collmn di koi height ni hundi oh oni space lai lenda jini appan deie
                  child: Image.asset(
                    'assets/images/1046568.jpg',
                    fit: BoxFit.cover,

                    ///image nu container ch fit karan lai
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                //itembuilder takes an anonymous function  and its not called by us
                // then it iterates by incresing index and going through the list of widgets
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        ////// amount thing /////////////////////
                        child: Text(
                          r'$' + // to print $
                              '${transactions[index].amount.toStringAsFixed(2)}', //shorter method to print a 'double' value called string interpolation
                          //tostringasfixed(n) will print upto n decimal places.
                          // and the value also gets rounded
                          style: TextStyle(fontSize: 20),
                        ),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(15),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            ////////title thing////////////
                            child: Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.title,
                            ),
                            //color: Colors.purple[100],
                            margin: EdgeInsets.all(6),
                          ),
                          Card(
                            child: Text(
                              //////////date thing////////////
                              // DateFormat('dd/MM/yyyy').format(tx.date),//the MM dhould beuppercase in dateformat
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              //tx.date.toString ,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w100),
                            ),
                            // color: Colors.purple[100],
                            //margin: EdgeInsets.all(10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  elevation: 10,
                );
              },
              itemCount: transactions
                  .length, // how many items are to be build initially 2
            ),
    );
  }
}
