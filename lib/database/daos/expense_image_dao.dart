import 'package:drift/drift.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/database/tables/tables.dart';

part 'expense_image_dao.g.dart';

@DriftAccessor(tables: [ExpenseImages])
class ExpenseImageDao extends DatabaseAccessor<AppDatabase> with _$ExpenseImageDaoMixin {
  ExpenseImageDao(super.db);

  Future<List<ExpenseImage>> getImagesForExpense(int expenseId) {
    return (select(expenseImages)..where((img) => img.expenseId.equals(expenseId))).get();
  }

  Future<void> insertImage(ExpenseImagesCompanion image) {
    return into(expenseImages).insert(image);
  }

  Future<void> deleteImage(int id) {
    return (delete(expenseImages)..where((img) => img.id.equals(id))).go();
  }

  Future<void> deleteImagesForExpense(int expenseId) {
    return (delete(expenseImages)..where((img) => img.expenseId.equals(expenseId))).go();
  }
}
