import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/expenses/expenses_state.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/database/daos/expense_dao.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  final ExpenseDao expenseDao;

  ExpensesCubit(this.expenseDao) : super(ExpensesLoading());

  Future<void> loadExpenses(int collectionId) async {
    try {
      emit(ExpensesLoading());
      final expenses = await expenseDao.getExpensesForCollection(collectionId);
      emit(ExpensesLoaded(expenses));
    } catch (e) {
      emit(ExpensesError('Failed to load expenses'));
    }
  }

  Future<void> addExpense(ExpensesCompanion expense) async {
    try {
      final insertedExpense = await expenseDao.insertAndReturn(expense);
      if (state is ExpensesLoaded) {
        final currentState = state as ExpensesLoaded;
        final newExpenses = List<Expense>.from(currentState.expenses)..add(insertedExpense);
        emit(ExpensesLoaded(newExpenses));
      }
    } catch (e) {
      emit(ExpensesError('Failed to add expense'));
    }
  }

  Future<void> deleteExpense(int id) async {
    try {
      await expenseDao.deleteExpense(id);
      if (state is ExpensesLoaded) {
        final currentState = state as ExpensesLoaded;
        final updatedExpenses = currentState.expenses.where((e) => e.id != id).toList();
        emit(ExpensesLoaded(updatedExpenses));
      }
    } catch (e) {
      emit(ExpensesError('Failed to delete expense'));
    }
  }
}
