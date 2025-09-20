import 'package:flutter/material.dart';
import 'package:money_free/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.myExpense,this.delete,this.i);
  void Function(int iii) delete;
  final Expense myExpense;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            myExpense.title,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
          ),
          Row(
            children: [
              Text("\$"+myExpense.amount.toStringAsFixed(2)),
              Spacer(),
              Icon(Icons.access_time_filled_rounded),
              Text(myExpense.date.toString())
            ],
          ),
          Row(
            children: [
              Icon(Icons.category),
              Text(myExpense.category.name),
              Spacer(),
              TextButton(onPressed: (){
                delete(i);
              }, child: Row(children: [
                Icon(Icons.delete),
                Text("Delete")
              ],) )
            ],
          )
        ],
      ),)
    );
  }

}