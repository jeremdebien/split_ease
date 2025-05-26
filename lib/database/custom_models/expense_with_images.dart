import 'package:split_ease/database/app_database.dart';

class ExpenseWithImages {
  final Expense expense;
  final List<ExpenseImage> images;

  ExpenseWithImages({
    required this.expense,
    required this.images,
  });
}
