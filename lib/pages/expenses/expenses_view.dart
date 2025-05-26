import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/expenses/expenses_cubit.dart';
import 'package:split_ease/cubit/expenses/expenses_state.dart';
import 'package:split_ease/database/app_database.dart';

class ExpensesView extends StatelessWidget {
  final int collectionId;

  const ExpensesView({super.key, required this.collectionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: BlocBuilder<ExpensesCubit, ExpensesState>(
        builder: (context, state) {
          if (state is ExpensesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExpensesLoaded) {
            final expenses = state.expenses;

            if (expenses.isEmpty) {
              return const Center(child: Text('No expenses found.'));
            }

            return ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return ListTile(
                  title: Text(expense.title),
                  subtitle: Text(
                    'Amount: ₱${expense.amount.toStringAsFixed(2)}\nDate: ${expense.date.toLocal().toString().split(' ')[0]}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<ExpensesCubit>().deleteExpense(expense.id);
                    },
                  ),
                );
              },
            );
          } else if (state is ExpensesError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Please wait...'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddExpenseDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text.trim();
              final amount = double.tryParse(amountController.text.trim());

              if (title.isNotEmpty && amount != null) {
                context.read<ExpensesCubit>().addExpense(
                      ExpensesCompanion(
                        collectionId: drift.Value(collectionId),
                        title: drift.Value(title),
                        amount: drift.Value(amount),
                        paidBy: const drift.Value(1), // Placeholder; ideally select payer dynamically
                      ),
                    );
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
