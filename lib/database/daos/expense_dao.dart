import 'package:drift/drift.dart';
import 'package:split_ease/database/custom_models/expense_with_images.dart';
import 'package:split_ease/database/tables/tables.dart';
import '../app_database.dart';

part 'expense_dao.g.dart';

@DriftAccessor(tables: [Expenses, ExpenseImages])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(super.db);

  // Fetch all expenses under a specific collection
  Future<List<Expense>> getExpensesForCollection(int collectionId) => (select(expenses)..where((e) => e.collectionId.equals(collectionId))).get();

  // Fetch combined model: Expense with its associated images
  Future<List<ExpenseWithImages>> getExpensesWithImages(int collectionId) async {
    final expenseList = await getExpensesForCollection(collectionId);
    final List<ExpenseWithImages> combinedList = [];

    for (final expense in expenseList) {
      try {
        final images = await (select(expenseImages)..where((img) => img.expenseId.equals(expense.id))).get();
        combinedList.add(ExpenseWithImages(expense: expense, images: images));
      } catch (e) {
        print('Failed to get images for expense id ${expense.id}: $e');
        combinedList.add(ExpenseWithImages(expense: expense, images: []));
      }
    }

    return combinedList;
  }

  // Insert expense and return inserted row
  Future<Expense> insertAndReturn(ExpensesCompanion expense) {
    return into(expenses).insertReturning(expense);
  }

  // Insert expense (without returning)
  Future<int> insertExpense(ExpensesCompanion expense) => into(expenses).insert(expense);

  // Delete expense by ID
  Future<int> deleteExpense(int id) => (delete(expenses)..where((e) => e.id.equals(id))).go();
}
