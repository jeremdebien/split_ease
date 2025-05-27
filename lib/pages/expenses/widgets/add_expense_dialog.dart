import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:split_ease/common/forms/expense_form.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/cubit/expenses/expenses_cubit.dart';
import 'package:drift/drift.dart' as drift;

class AddExpenseDialog extends StatefulWidget {
  final int collectionId;

  const AddExpenseDialog({super.key, required this.collectionId});

  @override
  State<AddExpenseDialog> createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  List<XFile> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Expense'),
      content: SingleChildScrollView(
        child: ExpenseForm(
          titleController: titleController,
          amountController: amountController,
          onImagesSelected: (images) => selectedImages = images,
          onSelectedPersonsChanged: (p0) {},
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Add'),
        ),
      ],
    );
  }

  void _submit() {
    final title = titleController.text.trim();
    final amount = double.tryParse(amountController.text.trim());

    if (title.isNotEmpty && amount != null) {
      context.read<ExpensesCubit>().addExpenseWithImages(
            ExpensesCompanion(
              collectionId: drift.Value(widget.collectionId),
              title: drift.Value(title),
              amount: drift.Value(amount),
              paidBy: const drift.Value(1),
            ),
            selectedImages.map((e) => ExpenseImagesCompanion(path: drift.Value(e.path))).toList(),
          );
      Navigator.pop(context);
    }
  }
}
