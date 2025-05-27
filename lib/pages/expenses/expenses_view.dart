import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:split_ease/common/widgets/custom_image_picker.dart';
import 'package:split_ease/cubit/expenses/expenses_cubit.dart';
import 'package:split_ease/cubit/expenses/expenses_state.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/database/custom_models/expense_with_images.dart';

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
            final List<ExpenseWithImages> expensesWithImages = state.expensesWithImages;

            if (expensesWithImages.isEmpty) {
              return const Center(child: Text('No expenses found.'));
            }

            return ListView.builder(
              itemCount: expensesWithImages.length,
              itemBuilder: (context, index) {
                final expenseWithImages = expensesWithImages[index];
                final expense = expenseWithImages.expense;
                final images = expenseWithImages.images;

                return ListTile(
                  title: Text(expense.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount: ₱${expense.amount.toStringAsFixed(2)}'),
                      Text('Date: ${expense.date.toLocal().toString().split(' ')[0]}'),
                      if (images.isNotEmpty)
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            itemBuilder: (context, imgIndex) {
                              final image = images[imgIndex];
                              return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Image.file(
                                    File(image.path),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ));
                            },
                          ),
                        ),
                    ],
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
    List<XFile> selectedImages = [];

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Expense'),
        content: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
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
                  const SizedBox(height: 12),
                  CustomImagePicker(
                    maxImages: 1,
                    onImagesSelected: (images) {
                      setState(() {
                        selectedImages = images;
                      });
                    },
                  ),
                ],
              ),
            );
          },
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
                context.read<ExpensesCubit>().addExpenseWithImages(
                      ExpensesCompanion(
                        collectionId: drift.Value(collectionId),
                        title: drift.Value(title),
                        amount: drift.Value(amount),
                        paidBy: const drift.Value(1),
                      ),
                      selectedImages.map((e) => ExpenseImagesCompanion(path: drift.Value(e.path))).toList(),
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
