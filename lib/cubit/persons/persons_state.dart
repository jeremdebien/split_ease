// persons_state.dart
import 'package:equatable/equatable.dart';
import 'package:split_ease/database/app_database.dart';

abstract class PersonsState extends Equatable {
  const PersonsState();

  @override
  List<Object> get props => [];
}

class PersonsInitial extends PersonsState {
  const PersonsInitial();
}

class PersonsLoading extends PersonsState {
  const PersonsLoading();
}

class PersonsLoaded extends PersonsState {
  final List<Person> persons;

  const PersonsLoaded(this.persons);

  @override
  List<Object> get props => [persons];
}

class PersonsError extends PersonsState {
  final String message;

  const PersonsError(this.message);

  @override
  List<Object> get props => [message];
}
