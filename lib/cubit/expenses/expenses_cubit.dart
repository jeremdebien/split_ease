import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/expenses/expenses_state.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/database/daos/expense_dao.dart';
import 'package:split_ease/database/daos/expense_image_dao.dart';
import 'package:split_ease/database/custom_models/expense_with_images.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  final ExpenseDao expenseDao;
  final ExpenseImageDao expenseImageDao;

  ExpensesCubit(this.expenseDao, this.expenseImageDao) : super(ExpensesLoading());

  // Load combined expenses with images
  Future<void> loadExpenses(int collectionId) async {
    try {
      emit(ExpensesLoading());
      final expensesWithImages = await expenseDao.getExpensesWithImages(collectionId);
      emit(ExpensesLoaded(expensesWithImages));
    } catch (e, stacktrace) {
      print('Error loading expenses: $e');
      print(stacktrace);
      emit(ExpensesError('Failed to load expenses: $e'));
    }
  }

  // Add expense and images, then update state with combined model
  Future<void> addExpenseWithImages(
    ExpensesCompanion expense,
    List<ExpenseImagesCompanion> images,
  ) async {
    try {
      await expenseDao.db.transaction(() async {
        final insertedExpense = await expenseDao.insertAndReturn(expense);

        for (final image in images) {
          final imageWithExpenseId = image.copyWith(expenseId: Value(insertedExpense.id));
          await expenseImageDao.insertImage(imageWithExpenseId);
        }

        if (state is ExpensesLoaded) {
          final currentState = state as ExpensesLoaded;

          final newExpenseWithImages = ExpenseWithImages(
            expense: insertedExpense,
            images: await expenseImageDao.getImagesForExpense(insertedExpense.id),
          );

          final newList = List<ExpenseWithImages>.from(currentState.expensesWithImages)..add(newExpenseWithImages);

          emit(ExpensesLoaded(newList));
        }
      });
    } catch (e) {
      emit(ExpensesError('Failed to add expense with images'));
    }
  }

  // Optionally add expense without images
  Future<void> addExpense(ExpensesCompanion expense) async {
    try {
      final insertedExpense = await expenseDao.insertAndReturn(expense);

      if (state is ExpensesLoaded) {
        final currentState = state as ExpensesLoaded;
        final newExpenseWithImages = ExpenseWithImages(
          expense: insertedExpense,
          images: [],
        );

        final newList = List<ExpenseWithImages>.from(currentState.expensesWithImages)..add(newExpenseWithImages);

        emit(ExpensesLoaded(newList));
      }
    } catch (e) {
      emit(ExpensesError('Failed to add expense'));
    }
  }

  // Delete expense and its images
  Future<void> deleteExpense(int id) async {
    try {
      await expenseDao.deleteExpense(id);
      await expenseImageDao.deleteImagesForExpense(id);

      if (state is ExpensesLoaded) {
        final currentState = state as ExpensesLoaded;
        final updatedList = currentState.expensesWithImages.where((e) => e.expense.id != id).toList();
        emit(ExpensesLoaded(updatedList));
      }
    } catch (e) {
      emit(ExpensesError('Failed to delete expense'));
    }
  }
}
