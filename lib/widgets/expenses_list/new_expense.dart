import 'dart:ffi';

import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:money_free/model/expense.dart';

class NewExpense  extends StatefulWidget{
  NewExpense(this.addExpense,{super.key});

  void Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }

}

class _NewExpenseState extends State<NewExpense>{
  var SELECTEDCATEGORY=Category.FOOD;
  final TextEditingController myTitleCont = TextEditingController();
  final TextEditingController myAmountCont = TextEditingController();

  @override
  void dispose() {
    myTitleCont.dispose();
    myAmountCont.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,

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
                maxLength: 30,
                controller: myTitleCont,
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text("Amount"),
                    enabledBorder: UnderlineInputBorder()
                ),
                maxLength: 10,
                controller: myAmountCont,
                keyboardType: TextInputType.number,
              ),
              DropdownButton<Category>(
                  items: Category.values.map((e) => DropdownMenuItem(value: e,child: Text(e.name))).toList(),
                  value: SELECTEDCATEGORY,
                  onChanged:(vvv) {

                    setState(() {
                      SELECTEDCATEGORY = vvv!;
                    });
              }),
              Row(
                children: [
                  ElevatedButton(onPressed: () {
                    widget.addExpense(Expense(myTitleCont.text,double.parse(myAmountCont.text), DateTime.now(), SELECTEDCATEGORY));
                    Navigator.pop(context);
                  }, child: Text("SAVE")),
                  Spacer(),
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("CANCEL"))

                ],
              )
            ],
          )
      ),
    );
  }
}