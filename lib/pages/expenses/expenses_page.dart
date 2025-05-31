import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/pages/expenses/expenses_view.dart';
import 'package:split_ease/cubit/expenses/expenses_cubit.dart';

class ExpensesPage extends StatelessWidget {
  final int collectionId;

  const ExpensesPage({super.key, required this.collectionId});

  @override
  Widget build(BuildContext context) {
    context.read<ExpensesCubit>().loadExpenses(collectionId);
    return ExpensesView(collectionId: collectionId);
  }
}
