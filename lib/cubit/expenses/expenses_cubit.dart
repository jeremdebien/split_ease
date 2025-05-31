import 'dart:async';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/expenses/expenses_state.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/database/daos/expense_dao.dart';
import 'package:split_ease/database/daos/expense_image_dao.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  final ExpenseDao expenseDao;
  final ExpenseImageDao expenseImageDao;
  StreamSubscription? _expensesSubscription;
  int? _currentCollectionId; // To track the current collection ID for the stream

  ExpensesCubit(this.expenseDao, this.expenseImageDao) : super(ExpensesInitial());

  // Load combined expenses with images
  Future<void> loadExpenses(int collectionId) async {
    if (_currentCollectionId == collectionId && (state is ExpensesLoaded || state is ExpensesLoading)) {
      // Avoid reloading if already loading/loaded for this collection or if stream is already active
      // Or, if you want to force refresh, you can proceed.
      // For a stream-based approach, this might just set up the stream if not already.
      if (_expensesSubscription != null && _currentCollectionId == collectionId) return;
    }
    _currentCollectionId = collectionId;

    try {
      emit(ExpensesLoading());
      _expensesSubscription?.cancel(); // Cancel previous subscription
      _expensesSubscription = expenseDao
          .watchExpensesWithImages(collectionId)
          .listen((expensesWithImages) => emit(ExpensesLoaded(expensesWithImages)), onError: (e, stacktrace) {
        print('Error watching expenses: $e');
        print(stacktrace);
        emit(ExpensesError('Failed to watch expenses: $e'));
      });
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
        // The reactive stream from watchExpensesWithImages will update the state.
      });
    } catch (e) {
      emit(ExpensesError('Failed to add expense with images'));
    }
  }

  // Optionally add expense without images
  Future<void> addExpense(ExpensesCompanion expense) async {
    try {
      await expenseDao.insertAndReturn(expense);
      // The reactive stream from watchExpensesWithImages will update the state.
    } catch (e) {
      emit(ExpensesError('Failed to add expense'));
    }
  }

  // Delete expense and its images
  Future<void> deleteExpense(int expenseId) async {
    try {
      // The ON DELETE CASCADE constraint on ExpenseImages.expenseId
      // should automatically delete associated images when an expense is deleted.
      // So, `await expenseImageDao.deleteImagesForExpense(expenseId);` is likely redundant.
      await expenseDao.deleteExpense(expenseId);
      // The reactive stream from watchExpensesWithImages will update the state.
    } catch (e) {
      emit(ExpensesError('Failed to delete expense'));
    }
  }

  @override
  Future<void> close() {
    _expensesSubscription?.cancel();
    return super.close();
  }
}
