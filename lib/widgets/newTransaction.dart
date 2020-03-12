import 'package:flutter/material.dart';

///////it contains  the transaction text fields container and the flat button for adding new transactions///////////////
class NewTransaction extends StatefulWidget {
  final Function addNew;
  NewTransaction(this.addNew);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();
  final amount = TextEditingController(); //controllers for the text fields

  void submit() {
    if ((title.text).isEmpty || (double.parse(amount.text)) <= 0) {
      return;
    }
    widget.addNew(
      title.text,
      double.parse(amount.text),
    );
    //addNew function is in userTransaction.
    // amount should be always double
    /// to convert string to double do double.parse('string')
  Navigator.of(context).pop();//used to close the topmost section of the screen
  }

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
                keyboardType: TextInputType.text,
              ),
              TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  // onChanged: (value){
                  // amount=value;
                  //},
                  controller: amount,
                  keyboardType:
                      TextInputType.number, //only a number(double) to be typed
                  onSubmitted: (val) => submit() //pointer to that function
                  //// IMP onSubmitted will always return a string so there is a need to fake it that we are receiving it
                  ///although we are not using it here
                  ),
              FlatButton(
                child: Text('Add transaction'),
                onPressed: () {
                  submit();
                },
                textColor: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
