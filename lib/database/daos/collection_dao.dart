import 'package:drift/drift.dart';
import 'package:split_ease/database/tables/tables.dart';
import '../app_database.dart';

part 'collection_dao.g.dart';

@DriftAccessor(tables: [Collections])
class CollectionDao extends DatabaseAccessor<AppDatabase> with _$CollectionDaoMixin {
  CollectionDao(AppDatabase db) : super(db);

  Future<List<Collection>> getAllCollections() => select(collections).get();

  Stream<List<Collection>> watchAllCollections() => select(collections).watch();

  Future<int> insertCollection(CollectionsCompanion collection) => into(collections).insert(collection);

  Future<int> deleteCollection(int id) => (delete(collections)..where((c) => c.id.equals(id))).go();
}
