import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/collection/collection_cubit.dart';
import 'package:split_ease/cubit/collection/collection_state.dart';
import 'package:split_ease/pages/expenses/expenses_page.dart';

class CollectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Collections')),
      body: BlocBuilder<CollectionCubit, CollectionState>(
        builder: (context, state) {
          if (state is CollectionLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CollectionLoaded) {
            final collections = state.collections;
            if (collections.isEmpty) {
              return Center(child: Text('No collections found.'));
            }
            return ListView.builder(
              itemCount: collections.length,
              itemBuilder: (context, index) {
                final collection = collections[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExpensesPage(collectionId: collection.id),
                      )),
                  child: ListTile(
                    title: Text(collection.name),
                    subtitle: Text(collection.description ?? ''),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        context.read<CollectionCubit>().deleteCollection(collection.id);
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is CollectionError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          // Initial or unknown state
          return Center(child: Text('Welcome!'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCollectionDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddCollectionDialog(BuildContext context) {
    final _controller = TextEditingController();
    final _descController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Collection'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final name = _controller.text.trim();
              final desc = _descController.text.trim();
              if (name.isNotEmpty) {
                context.read<CollectionCubit>().addCollection(name, description: desc.isEmpty ? null : desc);
                Navigator.pop(context);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
