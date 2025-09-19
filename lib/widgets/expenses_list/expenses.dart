import 'package:flutter/material.dart';
import 'package:money_free/widgets/expenses_list/expenses_list.dart';

import '../../model/expense.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regexpenses=[
    Expense( "Flutter Course", 19.99, DateTime.now(), Category.WORK),
    Expense( "Pizza", 50.00, DateTime.now(), Category.FOOD),
    Expense( "Pizza", 50.00, DateTime.now(), Category.FOOD),
    Expense( "Pizza", 50.00, DateTime.now(), Category.FOOD),
    Expense( "Pizza", 50.00, DateTime.now(), Category.FOOD),
    Expense( "Pizza", 50.00, DateTime.now(), Category.FOOD),
    Expense( "Pizza", 50.00, DateTime.now(), Category.FOOD),
    Expense( "Pizza", 50.00, DateTime.now(), Category.FOOD)
  ];


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
              return Container(
                height: 400,

                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          label: Text("Title"),
                          enabledBorder: UnderlineInputBorder()
                        ),
                        maxLength: 10,
                        onChanged: (value) {

                        },
                      ),
                      Row(
                        children: [
                          ElevatedButton(onPressed: () {

                          }, child: Text("Submit"))
                        ],
                      )
                    ],
                  )
                ),
              );
            });
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: Expanded(
                child:ExpensesList(_regexpenses)
            )
          )

        ],
      ) ,
    );
  }

}