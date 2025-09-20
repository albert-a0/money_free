
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_free/widgets/expenses_list/expense_item.dart';

import '../../model/expense.dart';

class ExpensesList extends StatelessWidget{
  ExpensesList(this.expenses,this.deleteExpense);
  final List<Expense> expenses;
  void Function(int iii) deleteExpense;

  @override
  Widget build(BuildContext context) {
    return
          ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (ctx,index){
                return ExpenseItem(expenses[index],deleteExpense,index);
              }
          );

  }

}