import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_ease/cubit/persons/persons_cubit.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/locator.dart';
import 'package:split_ease/pages/persons/persons_view.dart';

class PersonsPage extends StatelessWidget {
  const PersonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PersonsCubit(getIt<AppDatabase>().personDao),
      child: const PersonsView(),
    );
  }
}
