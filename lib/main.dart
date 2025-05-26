import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/collection/collection_cubit.dart';
import 'package:split_ease/pages/collection/collection_page.dart';

import 'database/app_database.dart';

void main() {
  // Initialize the database before runApp (optional)
  final database = AppDatabase();

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SplitEase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CollectionCubit(database.collectionDao),
        child: CollectionsPage(database: database),
      ),
    );
  }
}
