// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CollectionsTable extends Collections
    with TableInfo<$CollectionsTable, Collection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collections';
  @override
  VerificationContext validateIntegrity(Insertable<Collection> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Collection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Collection(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CollectionsTable createAlias(String alias) {
    return $CollectionsTable(attachedDatabase, alias);
  }
}

class Collection extends DataClass implements Insertable<Collection> {
  final int id;
  final String name;
  final String? description;
  final DateTime createdAt;
  const Collection(
      {required this.id,
      required this.name,
      this.description,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CollectionsCompanion toCompanion(bool nullToAbsent) {
    return CollectionsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory Collection.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Collection(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Collection copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt}) =>
      Collection(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
      );
  Collection copyWithCompanion(CollectionsCompanion data) {
    return Collection(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Collection(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Collection &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class CollectionsCompanion extends UpdateCompanion<Collection> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  const CollectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CollectionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Collection> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CollectionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<DateTime>? createdAt}) {
    return CollectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PersonsTable extends Persons with TableInfo<$PersonsTable, Person> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  @override
  late final GeneratedColumn<int> collectionId = GeneratedColumn<int>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES collections(id) ON DELETE CASCADE');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, collectionId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'persons';
  @override
  VerificationContext validateIntegrity(Insertable<Person> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Person map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Person(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}collection_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $PersonsTable createAlias(String alias) {
    return $PersonsTable(attachedDatabase, alias);
  }
}

class Person extends DataClass implements Insertable<Person> {
  final int id;
  final int collectionId;
  final String name;
  const Person(
      {required this.id, required this.collectionId, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['collection_id'] = Variable<int>(collectionId);
    map['name'] = Variable<String>(name);
    return map;
  }

  PersonsCompanion toCompanion(bool nullToAbsent) {
    return PersonsCompanion(
      id: Value(id),
      collectionId: Value(collectionId),
      name: Value(name),
    );
  }

  factory Person.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Person(
      id: serializer.fromJson<int>(json['id']),
      collectionId: serializer.fromJson<int>(json['collectionId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'collectionId': serializer.toJson<int>(collectionId),
      'name': serializer.toJson<String>(name),
    };
  }

  Person copyWith({int? id, int? collectionId, String? name}) => Person(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        name: name ?? this.name,
      );
  Person copyWithCompanion(PersonsCompanion data) {
    return Person(
      id: data.id.present ? data.id.value : this.id,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Person(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, collectionId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Person &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.name == this.name);
}

class PersonsCompanion extends UpdateCompanion<Person> {
  final Value<int> id;
  final Value<int> collectionId;
  final Value<String> name;
  const PersonsCompanion({
    this.id = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.name = const Value.absent(),
  });
  PersonsCompanion.insert({
    this.id = const Value.absent(),
    required int collectionId,
    required String name,
  })  : collectionId = Value(collectionId),
        name = Value(name);
  static Insertable<Person> custom({
    Expression<int>? id,
    Expression<int>? collectionId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (collectionId != null) 'collection_id': collectionId,
      if (name != null) 'name': name,
    });
  }

  PersonsCompanion copyWith(
      {Value<int>? id, Value<int>? collectionId, Value<String>? name}) {
    return PersonsCompanion(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<int>(collectionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonsCompanion(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  @override
  late final GeneratedColumn<int> collectionId = GeneratedColumn<int>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES collections(id) ON DELETE CASCADE');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paidByMeta = const VerificationMeta('paidBy');
  @override
  late final GeneratedColumn<int> paidBy = GeneratedColumn<int>(
      'paid_by', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES persons(id)');
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, collectionId, title, amount, paidBy, date, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(Insertable<Expense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('paid_by')) {
      context.handle(_paidByMeta,
          paidBy.isAcceptableOrUnknown(data['paid_by']!, _paidByMeta));
    } else if (isInserting) {
      context.missing(_paidByMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}collection_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      paidBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}paid_by'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final int id;
  final int collectionId;
  final String title;
  final double amount;
  final int paidBy;
  final DateTime date;
  final String? notes;
  const Expense(
      {required this.id,
      required this.collectionId,
      required this.title,
      required this.amount,
      required this.paidBy,
      required this.date,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['collection_id'] = Variable<int>(collectionId);
    map['title'] = Variable<String>(title);
    map['amount'] = Variable<double>(amount);
    map['paid_by'] = Variable<int>(paidBy);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      collectionId: Value(collectionId),
      title: Value(title),
      amount: Value(amount),
      paidBy: Value(paidBy),
      date: Value(date),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Expense.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<int>(json['id']),
      collectionId: serializer.fromJson<int>(json['collectionId']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<double>(json['amount']),
      paidBy: serializer.fromJson<int>(json['paidBy']),
      date: serializer.fromJson<DateTime>(json['date']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'collectionId': serializer.toJson<int>(collectionId),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<double>(amount),
      'paidBy': serializer.toJson<int>(paidBy),
      'date': serializer.toJson<DateTime>(date),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Expense copyWith(
          {int? id,
          int? collectionId,
          String? title,
          double? amount,
          int? paidBy,
          DateTime? date,
          Value<String?> notes = const Value.absent()}) =>
      Expense(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        title: title ?? this.title,
        amount: amount ?? this.amount,
        paidBy: paidBy ?? this.paidBy,
        date: date ?? this.date,
        notes: notes.present ? notes.value : this.notes,
      );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      title: data.title.present ? data.title.value : this.title,
      amount: data.amount.present ? data.amount.value : this.amount,
      paidBy: data.paidBy.present ? data.paidBy.value : this.paidBy,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('paidBy: $paidBy, ')
          ..write('date: $date, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, collectionId, title, amount, paidBy, date, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.title == this.title &&
          other.amount == this.amount &&
          other.paidBy == this.paidBy &&
          other.date == this.date &&
          other.notes == this.notes);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<int> id;
  final Value<int> collectionId;
  final Value<String> title;
  final Value<double> amount;
  final Value<int> paidBy;
  final Value<DateTime> date;
  final Value<String?> notes;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.paidBy = const Value.absent(),
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    required int collectionId,
    required String title,
    required double amount,
    required int paidBy,
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
  })  : collectionId = Value(collectionId),
        title = Value(title),
        amount = Value(amount),
        paidBy = Value(paidBy);
  static Insertable<Expense> custom({
    Expression<int>? id,
    Expression<int>? collectionId,
    Expression<String>? title,
    Expression<double>? amount,
    Expression<int>? paidBy,
    Expression<DateTime>? date,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (collectionId != null) 'collection_id': collectionId,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (paidBy != null) 'paid_by': paidBy,
      if (date != null) 'date': date,
      if (notes != null) 'notes': notes,
    });
  }

  ExpensesCompanion copyWith(
      {Value<int>? id,
      Value<int>? collectionId,
      Value<String>? title,
      Value<double>? amount,
      Value<int>? paidBy,
      Value<DateTime>? date,
      Value<String?>? notes}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      paidBy: paidBy ?? this.paidBy,
      date: date ?? this.date,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<int>(collectionId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paidBy.present) {
      map['paid_by'] = Variable<int>(paidBy.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('paidBy: $paidBy, ')
          ..write('date: $date, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $ExpenseSharesTable extends ExpenseShares
    with TableInfo<$ExpenseSharesTable, ExpenseShare> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseSharesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _expenseIdMeta =
      const VerificationMeta('expenseId');
  @override
  late final GeneratedColumn<int> expenseId = GeneratedColumn<int>(
      'expense_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES expenses(id) ON DELETE CASCADE');
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<int> personId = GeneratedColumn<int>(
      'person_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES persons(id)');
  static const VerificationMeta _shareAmountMeta =
      const VerificationMeta('shareAmount');
  @override
  late final GeneratedColumn<double> shareAmount = GeneratedColumn<double>(
      'share_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, expenseId, personId, shareAmount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_shares';
  @override
  VerificationContext validateIntegrity(Insertable<ExpenseShare> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('expense_id')) {
      context.handle(_expenseIdMeta,
          expenseId.isAcceptableOrUnknown(data['expense_id']!, _expenseIdMeta));
    } else if (isInserting) {
      context.missing(_expenseIdMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('share_amount')) {
      context.handle(
          _shareAmountMeta,
          shareAmount.isAcceptableOrUnknown(
              data['share_amount']!, _shareAmountMeta));
    } else if (isInserting) {
      context.missing(_shareAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseShare map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseShare(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      expenseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expense_id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}person_id'])!,
      shareAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}share_amount'])!,
    );
  }

  @override
  $ExpenseSharesTable createAlias(String alias) {
    return $ExpenseSharesTable(attachedDatabase, alias);
  }
}

class ExpenseShare extends DataClass implements Insertable<ExpenseShare> {
  final int id;
  final int expenseId;
  final int personId;
  final double shareAmount;
  const ExpenseShare(
      {required this.id,
      required this.expenseId,
      required this.personId,
      required this.shareAmount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['expense_id'] = Variable<int>(expenseId);
    map['person_id'] = Variable<int>(personId);
    map['share_amount'] = Variable<double>(shareAmount);
    return map;
  }

  ExpenseSharesCompanion toCompanion(bool nullToAbsent) {
    return ExpenseSharesCompanion(
      id: Value(id),
      expenseId: Value(expenseId),
      personId: Value(personId),
      shareAmount: Value(shareAmount),
    );
  }

  factory ExpenseShare.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseShare(
      id: serializer.fromJson<int>(json['id']),
      expenseId: serializer.fromJson<int>(json['expenseId']),
      personId: serializer.fromJson<int>(json['personId']),
      shareAmount: serializer.fromJson<double>(json['shareAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'expenseId': serializer.toJson<int>(expenseId),
      'personId': serializer.toJson<int>(personId),
      'shareAmount': serializer.toJson<double>(shareAmount),
    };
  }

  ExpenseShare copyWith(
          {int? id, int? expenseId, int? personId, double? shareAmount}) =>
      ExpenseShare(
        id: id ?? this.id,
        expenseId: expenseId ?? this.expenseId,
        personId: personId ?? this.personId,
        shareAmount: shareAmount ?? this.shareAmount,
      );
  ExpenseShare copyWithCompanion(ExpenseSharesCompanion data) {
    return ExpenseShare(
      id: data.id.present ? data.id.value : this.id,
      expenseId: data.expenseId.present ? data.expenseId.value : this.expenseId,
      personId: data.personId.present ? data.personId.value : this.personId,
      shareAmount:
          data.shareAmount.present ? data.shareAmount.value : this.shareAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseShare(')
          ..write('id: $id, ')
          ..write('expenseId: $expenseId, ')
          ..write('personId: $personId, ')
          ..write('shareAmount: $shareAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, expenseId, personId, shareAmount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseShare &&
          other.id == this.id &&
          other.expenseId == this.expenseId &&
          other.personId == this.personId &&
          other.shareAmount == this.shareAmount);
}

class ExpenseSharesCompanion extends UpdateCompanion<ExpenseShare> {
  final Value<int> id;
  final Value<int> expenseId;
  final Value<int> personId;
  final Value<double> shareAmount;
  const ExpenseSharesCompanion({
    this.id = const Value.absent(),
    this.expenseId = const Value.absent(),
    this.personId = const Value.absent(),
    this.shareAmount = const Value.absent(),
  });
  ExpenseSharesCompanion.insert({
    this.id = const Value.absent(),
    required int expenseId,
    required int personId,
    required double shareAmount,
  })  : expenseId = Value(expenseId),
        personId = Value(personId),
        shareAmount = Value(shareAmount);
  static Insertable<ExpenseShare> custom({
    Expression<int>? id,
    Expression<int>? expenseId,
    Expression<int>? personId,
    Expression<double>? shareAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (expenseId != null) 'expense_id': expenseId,
      if (personId != null) 'person_id': personId,
      if (shareAmount != null) 'share_amount': shareAmount,
    });
  }

  ExpenseSharesCompanion copyWith(
      {Value<int>? id,
      Value<int>? expenseId,
      Value<int>? personId,
      Value<double>? shareAmount}) {
    return ExpenseSharesCompanion(
      id: id ?? this.id,
      expenseId: expenseId ?? this.expenseId,
      personId: personId ?? this.personId,
      shareAmount: shareAmount ?? this.shareAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (expenseId.present) {
      map['expense_id'] = Variable<int>(expenseId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<int>(personId.value);
    }
    if (shareAmount.present) {
      map['share_amount'] = Variable<double>(shareAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseSharesCompanion(')
          ..write('id: $id, ')
          ..write('expenseId: $expenseId, ')
          ..write('personId: $personId, ')
          ..write('shareAmount: $shareAmount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CollectionsTable collections = $CollectionsTable(this);
  late final $PersonsTable persons = $PersonsTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $ExpenseSharesTable expenseShares = $ExpenseSharesTable(this);
  late final CollectionDao collectionDao = CollectionDao(this as AppDatabase);
  late final PersonDao personDao = PersonDao(this as AppDatabase);
  late final ExpenseDao expenseDao = ExpenseDao(this as AppDatabase);
  late final ExpenseShareDao expenseShareDao =
      ExpenseShareDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [collections, persons, expenses, expenseShares];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('collections',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('persons', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('collections',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('expenses', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('expenses',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('expense_shares', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$CollectionsTableCreateCompanionBuilder = CollectionsCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<DateTime> createdAt,
});
typedef $$CollectionsTableUpdateCompanionBuilder = CollectionsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<DateTime> createdAt,
});

final class $$CollectionsTableReferences
    extends BaseReferences<_$AppDatabase, $CollectionsTable, Collection> {
  $$CollectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PersonsTable, List<Person>> _personsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.persons,
          aliasName:
              $_aliasNameGenerator(db.collections.id, db.persons.collectionId));

  $$PersonsTableProcessedTableManager get personsRefs {
    final manager = $$PersonsTableTableManager($_db, $_db.persons)
        .filter((f) => f.collectionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_personsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.expenses,
          aliasName: $_aliasNameGenerator(
              db.collections.id, db.expenses.collectionId));

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager($_db, $_db.expenses)
        .filter((f) => f.collectionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CollectionsTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> personsRefs(
      Expression<bool> Function($$PersonsTableFilterComposer f) f) {
    final $$PersonsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.persons,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableFilterComposer(
              $db: $db,
              $table: $db.persons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> expensesRefs(
      Expression<bool> Function($$ExpensesTableFilterComposer f) f) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableFilterComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CollectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$CollectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> personsRefs<T extends Object>(
      Expression<T> Function($$PersonsTableAnnotationComposer a) f) {
    final $$PersonsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.persons,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableAnnotationComposer(
              $db: $db,
              $table: $db.persons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> expensesRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableAnnotationComposer a) f) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CollectionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CollectionsTable,
    Collection,
    $$CollectionsTableFilterComposer,
    $$CollectionsTableOrderingComposer,
    $$CollectionsTableAnnotationComposer,
    $$CollectionsTableCreateCompanionBuilder,
    $$CollectionsTableUpdateCompanionBuilder,
    (Collection, $$CollectionsTableReferences),
    Collection,
    PrefetchHooks Function({bool personsRefs, bool expensesRefs})> {
  $$CollectionsTableTableManager(_$AppDatabase db, $CollectionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CollectionsCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CollectionsCompanion.insert(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CollectionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({personsRefs = false, expensesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (personsRefs) db.persons,
                if (expensesRefs) db.expenses
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (personsRefs)
                    await $_getPrefetchedData<Collection, $CollectionsTable,
                            Person>(
                        currentTable: table,
                        referencedTable:
                            $$CollectionsTableReferences._personsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CollectionsTableReferences(db, table, p0)
                                .personsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.collectionId == item.id),
                        typedResults: items),
                  if (expensesRefs)
                    await $_getPrefetchedData<Collection, $CollectionsTable,
                            Expense>(
                        currentTable: table,
                        referencedTable:
                            $$CollectionsTableReferences._expensesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CollectionsTableReferences(db, table, p0)
                                .expensesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.collectionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CollectionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CollectionsTable,
    Collection,
    $$CollectionsTableFilterComposer,
    $$CollectionsTableOrderingComposer,
    $$CollectionsTableAnnotationComposer,
    $$CollectionsTableCreateCompanionBuilder,
    $$CollectionsTableUpdateCompanionBuilder,
    (Collection, $$CollectionsTableReferences),
    Collection,
    PrefetchHooks Function({bool personsRefs, bool expensesRefs})>;
typedef $$PersonsTableCreateCompanionBuilder = PersonsCompanion Function({
  Value<int> id,
  required int collectionId,
  required String name,
});
typedef $$PersonsTableUpdateCompanionBuilder = PersonsCompanion Function({
  Value<int> id,
  Value<int> collectionId,
  Value<String> name,
});

final class $$PersonsTableReferences
    extends BaseReferences<_$AppDatabase, $PersonsTable, Person> {
  $$PersonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CollectionsTable _collectionIdTable(_$AppDatabase db) =>
      db.collections.createAlias(
          $_aliasNameGenerator(db.persons.collectionId, db.collections.id));

  $$CollectionsTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<int>('collection_id')!;

    final manager = $$CollectionsTableTableManager($_db, $_db.collections)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.expenses,
          aliasName: $_aliasNameGenerator(db.persons.id, db.expenses.paidBy));

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager($_db, $_db.expenses)
        .filter((f) => f.paidBy.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ExpenseSharesTable, List<ExpenseShare>>
      _expenseSharesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.expenseShares,
              aliasName: $_aliasNameGenerator(
                  db.persons.id, db.expenseShares.personId));

  $$ExpenseSharesTableProcessedTableManager get expenseSharesRefs {
    final manager = $$ExpenseSharesTableTableManager($_db, $_db.expenseShares)
        .filter((f) => f.personId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expenseSharesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PersonsTableFilterComposer
    extends Composer<_$AppDatabase, $PersonsTable> {
  $$PersonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  $$CollectionsTableFilterComposer get collectionId {
    final $$CollectionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableFilterComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> expensesRefs(
      Expression<bool> Function($$ExpensesTableFilterComposer f) f) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.paidBy,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableFilterComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> expenseSharesRefs(
      Expression<bool> Function($$ExpenseSharesTableFilterComposer f) f) {
    final $$ExpenseSharesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenseShares,
        getReferencedColumn: (t) => t.personId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpenseSharesTableFilterComposer(
              $db: $db,
              $table: $db.expenseShares,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PersonsTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonsTable> {
  $$PersonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  $$CollectionsTableOrderingComposer get collectionId {
    final $$CollectionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableOrderingComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PersonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonsTable> {
  $$PersonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$CollectionsTableAnnotationComposer get collectionId {
    final $$CollectionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableAnnotationComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> expensesRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableAnnotationComposer a) f) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.paidBy,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> expenseSharesRefs<T extends Object>(
      Expression<T> Function($$ExpenseSharesTableAnnotationComposer a) f) {
    final $$ExpenseSharesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenseShares,
        getReferencedColumn: (t) => t.personId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpenseSharesTableAnnotationComposer(
              $db: $db,
              $table: $db.expenseShares,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PersonsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PersonsTable,
    Person,
    $$PersonsTableFilterComposer,
    $$PersonsTableOrderingComposer,
    $$PersonsTableAnnotationComposer,
    $$PersonsTableCreateCompanionBuilder,
    $$PersonsTableUpdateCompanionBuilder,
    (Person, $$PersonsTableReferences),
    Person,
    PrefetchHooks Function(
        {bool collectionId, bool expensesRefs, bool expenseSharesRefs})> {
  $$PersonsTableTableManager(_$AppDatabase db, $PersonsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PersonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PersonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> collectionId = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              PersonsCompanion(
            id: id,
            collectionId: collectionId,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int collectionId,
            required String name,
          }) =>
              PersonsCompanion.insert(
            id: id,
            collectionId: collectionId,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PersonsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {collectionId = false,
              expensesRefs = false,
              expenseSharesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (expensesRefs) db.expenses,
                if (expenseSharesRefs) db.expenseShares
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (collectionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.collectionId,
                    referencedTable:
                        $$PersonsTableReferences._collectionIdTable(db),
                    referencedColumn:
                        $$PersonsTableReferences._collectionIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (expensesRefs)
                    await $_getPrefetchedData<Person, $PersonsTable, Expense>(
                        currentTable: table,
                        referencedTable:
                            $$PersonsTableReferences._expensesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PersonsTableReferences(db, table, p0)
                                .expensesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.paidBy == item.id),
                        typedResults: items),
                  if (expenseSharesRefs)
                    await $_getPrefetchedData<Person, $PersonsTable,
                            ExpenseShare>(
                        currentTable: table,
                        referencedTable: $$PersonsTableReferences
                            ._expenseSharesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PersonsTableReferences(db, table, p0)
                                .expenseSharesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.personId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PersonsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PersonsTable,
    Person,
    $$PersonsTableFilterComposer,
    $$PersonsTableOrderingComposer,
    $$PersonsTableAnnotationComposer,
    $$PersonsTableCreateCompanionBuilder,
    $$PersonsTableUpdateCompanionBuilder,
    (Person, $$PersonsTableReferences),
    Person,
    PrefetchHooks Function(
        {bool collectionId, bool expensesRefs, bool expenseSharesRefs})>;
typedef $$ExpensesTableCreateCompanionBuilder = ExpensesCompanion Function({
  Value<int> id,
  required int collectionId,
  required String title,
  required double amount,
  required int paidBy,
  Value<DateTime> date,
  Value<String?> notes,
});
typedef $$ExpensesTableUpdateCompanionBuilder = ExpensesCompanion Function({
  Value<int> id,
  Value<int> collectionId,
  Value<String> title,
  Value<double> amount,
  Value<int> paidBy,
  Value<DateTime> date,
  Value<String?> notes,
});

final class $$ExpensesTableReferences
    extends BaseReferences<_$AppDatabase, $ExpensesTable, Expense> {
  $$ExpensesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CollectionsTable _collectionIdTable(_$AppDatabase db) =>
      db.collections.createAlias(
          $_aliasNameGenerator(db.expenses.collectionId, db.collections.id));

  $$CollectionsTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<int>('collection_id')!;

    final manager = $$CollectionsTableTableManager($_db, $_db.collections)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PersonsTable _paidByTable(_$AppDatabase db) => db.persons
      .createAlias($_aliasNameGenerator(db.expenses.paidBy, db.persons.id));

  $$PersonsTableProcessedTableManager get paidBy {
    final $_column = $_itemColumn<int>('paid_by')!;

    final manager = $$PersonsTableTableManager($_db, $_db.persons)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paidByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ExpenseSharesTable, List<ExpenseShare>>
      _expenseSharesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.expenseShares,
              aliasName: $_aliasNameGenerator(
                  db.expenses.id, db.expenseShares.expenseId));

  $$ExpenseSharesTableProcessedTableManager get expenseSharesRefs {
    final manager = $$ExpenseSharesTableTableManager($_db, $_db.expenseShares)
        .filter((f) => f.expenseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expenseSharesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$CollectionsTableFilterComposer get collectionId {
    final $$CollectionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableFilterComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableFilterComposer get paidBy {
    final $$PersonsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.paidBy,
        referencedTable: $db.persons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableFilterComposer(
              $db: $db,
              $table: $db.persons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> expenseSharesRefs(
      Expression<bool> Function($$ExpenseSharesTableFilterComposer f) f) {
    final $$ExpenseSharesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenseShares,
        getReferencedColumn: (t) => t.expenseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpenseSharesTableFilterComposer(
              $db: $db,
              $table: $db.expenseShares,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$CollectionsTableOrderingComposer get collectionId {
    final $$CollectionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableOrderingComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableOrderingComposer get paidBy {
    final $$PersonsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.paidBy,
        referencedTable: $db.persons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableOrderingComposer(
              $db: $db,
              $table: $db.persons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$CollectionsTableAnnotationComposer get collectionId {
    final $$CollectionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableAnnotationComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableAnnotationComposer get paidBy {
    final $$PersonsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.paidBy,
        referencedTable: $db.persons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableAnnotationComposer(
              $db: $db,
              $table: $db.persons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> expenseSharesRefs<T extends Object>(
      Expression<T> Function($$ExpenseSharesTableAnnotationComposer a) f) {
    final $$ExpenseSharesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenseShares,
        getReferencedColumn: (t) => t.expenseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpenseSharesTableAnnotationComposer(
              $db: $db,
              $table: $db.expenseShares,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExpensesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpensesTable,
    Expense,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableAnnotationComposer,
    $$ExpensesTableCreateCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder,
    (Expense, $$ExpensesTableReferences),
    Expense,
    PrefetchHooks Function(
        {bool collectionId, bool paidBy, bool expenseSharesRefs})> {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> collectionId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<int> paidBy = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              ExpensesCompanion(
            id: id,
            collectionId: collectionId,
            title: title,
            amount: amount,
            paidBy: paidBy,
            date: date,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int collectionId,
            required String title,
            required double amount,
            required int paidBy,
            Value<DateTime> date = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              ExpensesCompanion.insert(
            id: id,
            collectionId: collectionId,
            title: title,
            amount: amount,
            paidBy: paidBy,
            date: date,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ExpensesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {collectionId = false,
              paidBy = false,
              expenseSharesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (expenseSharesRefs) db.expenseShares
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (collectionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.collectionId,
                    referencedTable:
                        $$ExpensesTableReferences._collectionIdTable(db),
                    referencedColumn:
                        $$ExpensesTableReferences._collectionIdTable(db).id,
                  ) as T;
                }
                if (paidBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.paidBy,
                    referencedTable: $$ExpensesTableReferences._paidByTable(db),
                    referencedColumn:
                        $$ExpensesTableReferences._paidByTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (expenseSharesRefs)
                    await $_getPrefetchedData<Expense, $ExpensesTable,
                            ExpenseShare>(
                        currentTable: table,
                        referencedTable: $$ExpensesTableReferences
                            ._expenseSharesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExpensesTableReferences(db, table, p0)
                                .expenseSharesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.expenseId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ExpensesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExpensesTable,
    Expense,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableAnnotationComposer,
    $$ExpensesTableCreateCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder,
    (Expense, $$ExpensesTableReferences),
    Expense,
    PrefetchHooks Function(
        {bool collectionId, bool paidBy, bool expenseSharesRefs})>;
typedef $$ExpenseSharesTableCreateCompanionBuilder = ExpenseSharesCompanion
    Function({
  Value<int> id,
  required int expenseId,
  required int personId,
  required double shareAmount,
});
typedef $$ExpenseSharesTableUpdateCompanionBuilder = ExpenseSharesCompanion
    Function({
  Value<int> id,
  Value<int> expenseId,
  Value<int> personId,
  Value<double> shareAmount,
});

final class $$ExpenseSharesTableReferences
    extends BaseReferences<_$AppDatabase, $ExpenseSharesTable, ExpenseShare> {
  $$ExpenseSharesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ExpensesTable _expenseIdTable(_$AppDatabase db) =>
      db.expenses.createAlias(
          $_aliasNameGenerator(db.expenseShares.expenseId, db.expenses.id));

  $$ExpensesTableProcessedTableManager get expenseId {
    final $_column = $_itemColumn<int>('expense_id')!;

    final manager = $$ExpensesTableTableManager($_db, $_db.expenses)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_expenseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PersonsTable _personIdTable(_$AppDatabase db) =>
      db.persons.createAlias(
          $_aliasNameGenerator(db.expenseShares.personId, db.persons.id));

  $$PersonsTableProcessedTableManager get personId {
    final $_column = $_itemColumn<int>('person_id')!;

    final manager = $$PersonsTableTableManager($_db, $_db.persons)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExpenseSharesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpenseSharesTable> {
  $$ExpenseSharesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get shareAmount => $composableBuilder(
      column: $table.shareAmount, builder: (column) => ColumnFilters(column));

  $$ExpensesTableFilterComposer get expenseId {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.expenseId,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableFilterComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableFilterComposer get personId {
    final $$PersonsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.persons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableFilterComposer(
              $db: $db,
              $table: $db.persons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpenseSharesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpenseSharesTable> {
  $$ExpenseSharesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get shareAmount => $composableBuilder(
      column: $table.shareAmount, builder: (column) => ColumnOrderings(column));

  $$ExpensesTableOrderingComposer get expenseId {
    final $$ExpensesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.expenseId,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableOrderingComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableOrderingComposer get personId {
    final $$PersonsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.persons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableOrderingComposer(
              $db: $db,
              $table: $db.persons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpenseSharesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpenseSharesTable> {
  $$ExpenseSharesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get shareAmount => $composableBuilder(
      column: $table.shareAmount, builder: (column) => column);

  $$ExpensesTableAnnotationComposer get expenseId {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.expenseId,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableAnnotationComposer get personId {
    final $$PersonsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.persons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableAnnotationComposer(
              $db: $db,
              $table: $db.persons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpenseSharesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpenseSharesTable,
    ExpenseShare,
    $$ExpenseSharesTableFilterComposer,
    $$ExpenseSharesTableOrderingComposer,
    $$ExpenseSharesTableAnnotationComposer,
    $$ExpenseSharesTableCreateCompanionBuilder,
    $$ExpenseSharesTableUpdateCompanionBuilder,
    (ExpenseShare, $$ExpenseSharesTableReferences),
    ExpenseShare,
    PrefetchHooks Function({bool expenseId, bool personId})> {
  $$ExpenseSharesTableTableManager(_$AppDatabase db, $ExpenseSharesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseSharesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseSharesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseSharesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> expenseId = const Value.absent(),
            Value<int> personId = const Value.absent(),
            Value<double> shareAmount = const Value.absent(),
          }) =>
              ExpenseSharesCompanion(
            id: id,
            expenseId: expenseId,
            personId: personId,
            shareAmount: shareAmount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int expenseId,
            required int personId,
            required double shareAmount,
          }) =>
              ExpenseSharesCompanion.insert(
            id: id,
            expenseId: expenseId,
            personId: personId,
            shareAmount: shareAmount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExpenseSharesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({expenseId = false, personId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (expenseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.expenseId,
                    referencedTable:
                        $$ExpenseSharesTableReferences._expenseIdTable(db),
                    referencedColumn:
                        $$ExpenseSharesTableReferences._expenseIdTable(db).id,
                  ) as T;
                }
                if (personId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.personId,
                    referencedTable:
                        $$ExpenseSharesTableReferences._personIdTable(db),
                    referencedColumn:
                        $$ExpenseSharesTableReferences._personIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ExpenseSharesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExpenseSharesTable,
    ExpenseShare,
    $$ExpenseSharesTableFilterComposer,
    $$ExpenseSharesTableOrderingComposer,
    $$ExpenseSharesTableAnnotationComposer,
    $$ExpenseSharesTableCreateCompanionBuilder,
    $$ExpenseSharesTableUpdateCompanionBuilder,
    (ExpenseShare, $$ExpenseSharesTableReferences),
    ExpenseShare,
    PrefetchHooks Function({bool expenseId, bool personId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CollectionsTableTableManager get collections =>
      $$CollectionsTableTableManager(_db, _db.collections);
  $$PersonsTableTableManager get persons =>
      $$PersonsTableTableManager(_db, _db.persons);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$ExpenseSharesTableTableManager get expenseShares =>
      $$ExpenseSharesTableTableManager(_db, _db.expenseShares);
}
