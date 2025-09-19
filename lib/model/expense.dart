import "package:uuid/uuid.dart";

final uid= Uuid();

enum Category { FOOD, TRAVEL, LEISURE, WORK }

class Expense {
  Expense(
      this.title,
      this.amount,
      this.date,
      this.category
  ): id=uid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}