
import 'package:flutter/material.dart';
import 'package:money_free/widgets/expenses_list/expense_item.dart';

import '../../model/expense.dart';

class ExpensesList extends StatelessWidget{
  ExpensesList(this.expenses);
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx,index){
          return ExpenseItem(expenses[index]);
        }
    );
  }

}