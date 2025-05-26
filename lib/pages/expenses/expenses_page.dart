import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/pages/expenses/expenses_view.dart';
import 'package:split_ease/cubit/expenses/expenses_cubit.dart';
import 'package:split_ease/locator.dart';

class ExpensesPage extends StatelessWidget {
  final int collectionId;

  const ExpensesPage({super.key, required this.collectionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExpensesCubit(getIt<AppDatabase>().expenseDao)..loadExpenses(collectionId),
      child: ExpensesView(collectionId: collectionId),
    );
  }
}
