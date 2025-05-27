import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/expenses/expenses_cubit.dart';
import 'package:split_ease/cubit/expenses/expenses_state.dart';
import 'package:split_ease/pages/expenses/widgets/add_expense_dialog.dart';
import 'package:split_ease/pages/expenses/widgets/expense_item_tile.dart';

class ExpensesView extends StatelessWidget {
  final int collectionId;

  const ExpensesView({super.key, required this.collectionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      body: BlocBuilder<ExpensesCubit, ExpensesState>(
        builder: (context, state) {
          if (state is ExpensesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExpensesLoaded) {
            final expensesWithImages = state.expensesWithImages;
            if (expensesWithImages.isEmpty) {
              return const Center(child: Text('No expenses found.'));
            }

            final total = expensesWithImages.fold(0.0, (sum, e) => sum + e.expense.amount);

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Total Expenses: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('₱${total.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: expensesWithImages.length,
                    itemBuilder: (context, index) {
                      return ExpenseItemTile(expenseWithImages: expensesWithImages[index]);
                    },
                  ),
                ),
              ],
            );
          } else if (state is ExpensesError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Please wait...'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddExpenseDialog(collectionId: collectionId),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
