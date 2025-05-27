import 'package:drift/drift.dart';
import 'package:split_ease/database/tables/tables.dart';
import '../app_database.dart';

part 'person_dao.g.dart';

@DriftAccessor(tables: [Persons, PersonGroups, PersonGroupMembers])
class PersonDao extends DatabaseAccessor<AppDatabase> with _$PersonDaoMixin {
  PersonDao(super.db);

  // Get all persons
  Future<List<Person>> getAllPersons() => select(persons).get();

  // Insert a new person
  Future<int> insertPerson(PersonsCompanion person) => into(persons).insert(person);

  // Insert and return the new person
  Future<Person> insertAndReturn(PersonsCompanion person) => into(persons).insertReturning(person);

  // Delete a person by ID
  Future<int> deletePerson(int id) => (delete(persons)..where((p) => p.id.equals(id))).go();

  // ---------------------
  // Person Group Functions
  // ---------------------

  // Get all persons in a specific group
  Future<List<Person>> getPersonsInGroup(int groupId) async {
    final query = select(personGroupMembers).join([innerJoin(persons, persons.id.equalsExp(personGroupMembers.personId))])
      ..where(personGroupMembers.personGroupId.equals(groupId));

    final result = await query.get();
    return result.map((row) => row.readTable(persons)).toList();
  }

  // Add a person to a group
  Future<void> addPersonToGroup(int personId, int groupId) async {
    await into(personGroupMembers).insert(PersonGroupMembersCompanion(
      personId: Value(personId),
      personGroupId: Value(groupId),
    ));
  }

  // Remove a person from a group
  Future<void> removePersonFromGroup(int personId, int groupId) async {
    await (delete(personGroupMembers)..where((tbl) => tbl.personId.equals(personId) & tbl.personGroupId.equals(groupId))).go();
  }

  // Optional: Get all groups a person belongs to
  Future<List<PersonGroup>> getGroupsForPerson(int personId) async {
    final query = select(personGroupMembers).join([innerJoin(personGroups, personGroups.id.equalsExp(personGroupMembers.personGroupId))])
      ..where(personGroupMembers.personId.equals(personId));

    final result = await query.get();
    return result.map((row) => row.readTable(personGroups)).toList();
  }
}
