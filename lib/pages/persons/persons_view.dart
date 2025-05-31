import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/common/widgets/navbar.dart';
import 'package:split_ease/cubit/persons/persons_cubit.dart';
import 'package:split_ease/cubit/persons/persons_state.dart';
import 'package:drift/drift.dart' as drift;
import 'package:split_ease/database/app_database.dart';

class PersonsView extends StatelessWidget {
  const PersonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Persons')),
      bottomNavigationBar: const MobileNavBar(currentIndex: 1),
      body: BlocBuilder<PersonsCubit, PersonsState>(
        builder: (context, state) {
          if (state is PersonsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PersonsLoaded) {
            final persons = state.persons;
            if (persons.isEmpty) {
              return const Center(child: Text('No persons found.'));
            }
            return ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                final person = persons[index];
                return ListTile(
                  title: Text(person.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<PersonsCubit>().deletePerson(person.id);
                    },
                  ),
                );
              },
            );
          } else if (state is PersonsError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('Welcome!'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddPersonDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddPersonDialog(BuildContext context) {
    final _nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Person'),
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final name = _nameController.text.trim();
              if (name.isNotEmpty) {
                context.read<PersonsCubit>().addPerson(
                      PersonsCompanion(
                        name: drift.Value(name),
                      ),
                    );
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
