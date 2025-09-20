import 'package:flutter/material.dart';
import 'package:money_free/widgets/expenses_list/expenses_list.dart';
import 'package:money_free/widgets/expenses_list/new_expense.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../hello_test.dart';
import '../../model/expense.dart';
import '../../model/pie_data.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

}

class _ExpensesState extends State<Expenses> {
  List<Expense> _regexpenses=[];

  void addExpense(Expense expense){
    setState(() {
      _regexpenses.add(expense);
    });
  }

  void deleteExpense(int ii){
    setState(() {
      _regexpenses.removeAt(ii);
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Money Free"),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(onPressed: (){
            showModalBottomSheet(context: context, builder:(ctx) {
              return NewExpense(addExpense);
            });
          }, icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SfCircularChart(
                      title: ChartTitle(text: "Summary"),
                      legend: Legend(isVisible: true),
                      series: <PieSeries<PieData, String>> [
                        PieSeries<PieData, String>(
                          explode: true,
                          explodeIndex: 0,
                          dataSource: getPieData(_regexpenses),
                        xValueMapper: (PieData data, _) => data.xData,
                        yValueMapper: (PieData data, _) => data.yData,
                        dataLabelMapper: (PieData data, _) => data.text,
                        dataLabelSettings: DataLabelSettings(isVisible: true))

                      ]
                    ),
                    SizedBox(
                        height: 400,
                        child: ExpensesList(_regexpenses,deleteExpense) // Expanded removed
                    )
                  ],
                )
            )


          ],
        )
      ),
    );
  }

}