import 'package:drift/drift.dart';
import 'package:split_ease/database/tables/tables.dart';
import '../app_database.dart';

part 'person_dao.g.dart';

@DriftAccessor(tables: [Persons])
class PersonDao extends DatabaseAccessor<AppDatabase> with _$PersonDaoMixin {
  PersonDao(super.db);

  // Get all persons associated with a specific collection
  Future<List<Person>> getPersonsForCollection(int collectionId) => (select(persons)..where((p) => p.collectionId.equals(collectionId))).get();

  // Insert a new person into the database
  Future<int> insertPerson(PersonsCompanion person) => into(persons).insert(person);

  // Delete a person by their ID
  Future<int> deletePerson(int id) => (delete(persons)..where((p) => p.id.equals(id))).go();

  Future<Person> insertAndReturn(PersonsCompanion person) {
    return into(persons).insertReturning(person);
  }

  Future<List<Person>> getAllPersons() => select(persons).get();
}
