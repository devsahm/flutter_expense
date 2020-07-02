import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountCountroller = TextEditingController();

  void submitData(){
    final enteredTitle =titleController.text;
    final enteredAmount = double.parse(amountCountroller.text);

    if(enteredTitle.isEmpty || enteredAmount <=0){
      return;
    } 
    widget.addTx(
          enteredTitle,
          enteredAmount,
          );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) =>submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountCountroller,
              keyboardType: TextInputType.number,//it allows the keyboard to show number
              onSubmitted: (_) =>submitData,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
