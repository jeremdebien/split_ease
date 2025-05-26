import 'package:drift/drift.dart';
import 'package:split_ease/database/tables/tables.dart';
import '../app_database.dart';

part 'expense_dao.g.dart';

@DriftAccessor(tables: [Expenses])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(super.db);

  // Updated parameter and method to use collectionId instead of tripId
  Future<List<Expense>> getExpensesForCollection(int collectionId) => (select(expenses)..where((e) => e.collectionId.equals(collectionId))).get();

  Future<int> insertExpense(ExpensesCompanion expense) => into(expenses).insert(expense);

  Future<int> deleteExpense(int id) => (delete(expenses)..where((e) => e.id.equals(id))).go();

  Future<Expense> insertAndReturn(ExpensesCompanion expense) {
    return into(expenses).insertReturning(expense);
  }
}
