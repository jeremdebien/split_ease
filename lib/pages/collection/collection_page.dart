import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/pages/collection/collection_view.dart';
import 'package:split_ease/cubit/collection/collection_cubit.dart';
import 'package:split_ease/database/app_database.dart';

class CollectionsPage extends StatelessWidget {
  final AppDatabase database;

  const CollectionsPage({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CollectionCubit(database.collectionDao),
      child: CollectionView(),
    );
  }
}
