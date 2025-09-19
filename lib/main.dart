import 'package:flutter/material.dart';
import 'package:money_free/the_app.dart';
import 'package:money_free/widgets/expenses_list/expenses.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MaterialApp(
    home: Expenses(),
  ));
}

