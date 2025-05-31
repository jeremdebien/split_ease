// persons_cubit.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'persons_state.dart';
import 'package:split_ease/database/app_database.dart';
import 'package:split_ease/database/daos/person_dao.dart';

class PersonsCubit extends Cubit<PersonsState> {
  final PersonDao personDao;
  StreamSubscription? _personsSubscription;

  PersonsCubit(this.personDao) : super(const PersonsInitial()) {
    _watchPersons();
  }

  void _watchPersons() {
    emit(const PersonsLoading());
    _personsSubscription?.cancel();
    _personsSubscription = personDao.watchAllPersons().listen(
          (loadedPersons) => emit(PersonsLoaded(loadedPersons)),
          onError: (e) => emit(PersonsError('Failed to observe persons: $e')),
        );
  }

  Future<void> addPerson(PersonsCompanion person) async {
    try {
      await personDao.insertAndReturn(person);
      // State will update automatically via the stream
    } catch (e) {
      emit(PersonsError('Failed to add person: $e'));
    }
  }

  Future<void> deletePerson(int id) async {
    try {
      await personDao.deletePerson(id);
      // State will update automatically via the stream
    } catch (e) {
      emit(PersonsError('Failed to delete person: $e'));
    }
  }

  @override
  Future<void> close() {
    _personsSubscription?.cancel();
    return super.close();
  }
}
