import 'package:flutter/material.dart';

class NewExpense  extends StatefulWidget{
  NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }

}

class _NewExpenseState extends State<NewExpense>{
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
                onChanged: (value) {

                },
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text("Amount"),
                    enabledBorder: UnderlineInputBorder()
                ),
                maxLength: 10,
                onChanged: (value) {

                },
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text("Date"),
                    enabledBorder: UnderlineInputBorder()
                ),

                keyboardType: TextInputType.datetime,
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () {
                    showDatePicker(context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add( Duration(days: 365)),
                        initialDate: DateTime.now(),
                    ).then((value) {
                      print(value);
                    });
                  }, child: Text("Select Date")),
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