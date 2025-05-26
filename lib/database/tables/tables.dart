import 'package:drift/drift.dart';

class Collections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Persons extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get collectionId => integer().customConstraint('NOT NULL REFERENCES collections(id) ON DELETE CASCADE')();
  TextColumn get name => text().withLength(min: 1, max: 100)();
}

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get collectionId => integer().customConstraint('NOT NULL REFERENCES collections(id) ON DELETE CASCADE')();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  RealColumn get amount => real()();
  IntColumn get paidBy => integer().customConstraint('NOT NULL REFERENCES persons(id)')();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  TextColumn get notes => text().nullable()();
}

class ExpenseShares extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get expenseId => integer().customConstraint('NOT NULL REFERENCES expenses(id) ON DELETE CASCADE')();
  IntColumn get personId => integer().customConstraint('NOT NULL REFERENCES persons(id)')();
  RealColumn get shareAmount => real()();
}
