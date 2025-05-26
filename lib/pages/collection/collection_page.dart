import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/collection/collection_cubit.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/pages/collection/collection_view.dart';
import 'package:split_ease/locator.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CollectionCubit(getIt<AppDatabase>().collectionDao),
      child: CollectionView(),
    );
  }
}
