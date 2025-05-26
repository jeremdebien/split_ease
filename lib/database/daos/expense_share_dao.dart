import 'package:drift/drift.dart';
import 'package:split_ease/database/tables/tables.dart';
import '../app_database.dart';

part 'expense_share_dao.g.dart';

@DriftAccessor(tables: [ExpenseShares])
class ExpenseShareDao extends DatabaseAccessor<AppDatabase> with _$ExpenseShareDaoMixin {
  ExpenseShareDao(super.db);

  Future<List<ExpenseShare>> getSharesForExpense(int expenseId) => (select(expenseShares)..where((s) => s.expenseId.equals(expenseId))).get();

  Future<int> insertShare(ExpenseSharesCompanion share) => into(expenseShares).insert(share);

  Future<int> deleteSharesForExpense(int expenseId) => (delete(expenseShares)..where((s) => s.expenseId.equals(expenseId))).go();
}
