import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:split_ease/database/daos/expense_dao.dart';
import 'package:split_ease/database/daos/expense_image_dao.dart';
import 'package:split_ease/database/daos/expense_share_dao.dart';
import 'package:split_ease/database/daos/person_dao.dart';
import 'package:split_ease/database/daos/collection_dao.dart';
import 'dart:io';

import 'package:split_ease/database/tables/tables.dart';

part 'app_database.g.dart'; // Generated file

@DriftDatabase(
  tables: [Collections, Persons, PersonGroups, PersonGroupMembers, Expenses, ExpenseShares, ExpenseImages],
  daos: [CollectionDao, PersonDao, ExpenseDao, ExpenseShareDao, ExpenseImageDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'expenses.db'));
    return NativeDatabase(file);
  });
}
