import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:split_ease/common/widgets/custom_image_picker.dart';
import 'package:split_ease/cubit/persons/persons_cubit.dart';
import 'package:split_ease/cubit/persons/persons_state.dart';
import 'package:split_ease/database/app_database.dart';

class ExpenseForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  final Function(List<XFile>) onImagesSelected;
  final Function(List<Person>) onSelectedPersonsChanged;

  const ExpenseForm({
    super.key,
    required this.titleController,
    required this.amountController,
    required this.onImagesSelected,
    required this.onSelectedPersonsChanged,
  });

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  List<Person> _selectedPersons = [];

  void _onCheckboxChanged(bool? checked, Person person) {
    setState(() {
      if (checked == true) {
        _selectedPersons.add(person);
      } else {
        _selectedPersons.removeWhere((p) => p.id == person.id);
      }
    });

    widget.onSelectedPersonsChanged(_selectedPersons);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: widget.titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: widget.amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(labelText: 'Amount'),
        ),
        const SizedBox(height: 12),
        CustomImagePicker(
          maxImages: 1,
          onImagesSelected: widget.onImagesSelected,
        ),
        const SizedBox(height: 12),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('Assign to:', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        BlocBuilder<PersonsCubit, PersonsState>(
          builder: (context, state) {
            if (state is PersonsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PersonsLoaded) {
              return Column(
                children: state.persons.map((person) {
                  final isSelected = _selectedPersons.any((p) => p.id == person.id);
                  return CheckboxListTile(
                    title: Text(person.name),
                    value: isSelected,
                    onChanged: (checked) => _onCheckboxChanged(checked, person),
                  );
                }).toList(),
              );
            } else if (state is PersonsError) {
              return Text(state.message, style: const TextStyle(color: Colors.red));
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
