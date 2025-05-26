import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/collection/collection_cubit.dart';
import 'package:split_ease/locator.dart';
import 'package:split_ease/pages/collection/collection_page.dart';
import 'package:split_ease/database/app_database.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SplitEase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CollectionCubit(getIt<AppDatabase>().collectionDao),
        child: const CollectionsPage(),
      ),
    );
  }
}
