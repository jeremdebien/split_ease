// persons_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'persons_state.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/database/daos/person_dao.dart';

class PersonsCubit extends Cubit<PersonsState> {
  final PersonDao personDao;

  PersonsCubit(this.personDao) : super(const PersonsLoading());

  Future<void> loadPersons() async {
    try {
      emit(const PersonsLoading());
      final persons = await personDao.getAllPersons();
      emit(PersonsLoaded(persons));
    } catch (e) {
      emit(PersonsError('Failed to load persons'));
    }
  }

  Future<void> addPerson(PersonsCompanion person) async {
    try {
      final insertedPerson = await personDao.insertAndReturn(person);
      if (state is PersonsLoaded) {
        final currentState = state as PersonsLoaded;
        final newPersons = List<Person>.from(currentState.persons)..add(insertedPerson);
        emit(PersonsLoaded(newPersons));
      }
    } catch (e) {
      emit(PersonsError('Failed to add person'));
    }
  }

  Future<void> deletePerson(int id) async {
    try {
      await personDao.deletePerson(id);
      if (state is PersonsLoaded) {
        final current = state as PersonsLoaded;
        final newList = current.persons.where((p) => p.id != id).toList();
        emit(PersonsLoaded(newList));
      }
    } catch (e) {
      emit(PersonsError('Failed to delete person'));
    }
  }
}
