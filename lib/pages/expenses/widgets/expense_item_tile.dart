import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/expenses/expenses_cubit.dart';
import 'package:split_ease/database/custom_models/expense_with_images.dart';

class ExpenseItemTile extends StatelessWidget {
  final ExpenseWithImages expenseWithImages;

  const ExpenseItemTile({super.key, required this.expenseWithImages});

  @override
  Widget build(BuildContext context) {
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
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.file(
                      File(images[index].path),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  );
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
  }
}
