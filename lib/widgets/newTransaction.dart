

import 'package:flutter/material.dart';

/////// the transaction text fields container and the flat button for adding new transactions///////////////
class NewTransaction extends StatelessWidget {
  final title = TextEditingController();
  final amount = TextEditingController();
  final Function addNew;
  void Submit() {
    if ((title.text).isEmpty || (double.parse(amount.text))<=0) {
      return;
    }
      addNew(title.text, double.parse(amount.text));
      //addNew function is in userTransaction.
      // amount should be always double
      /// to convert string to double do double.parse('string')
  }

  NewTransaction(this.addNew); //constructor to calll
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'title'),
                //onChanged: (value) {
                //title = value;
                // },
                controller: title,
              ),
              TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  // onChanged: (value){
                  // amount=value;
                  //},
                  controller: amount,
                  keyboardType:
                      TextInputType.number, //only a number(double) to be typed
                  onSubmitted: (val) => Submit() //pointer to that function
                  //// IMP onSubmitted will always return a string so there is a need to fake it that we are receiving it
                  ///although we are not using it here
                  ),
              FlatButton(
                child: Text('Add transaction'),
                onPressed: () {
                  Submit();
                },
                textColor: Colors.purple[200],
              )
            ],
          ),
        ),
      ),
    );
  }
}
