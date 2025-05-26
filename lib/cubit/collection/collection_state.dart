import 'package:split_ease/database/app_database.dart';

abstract class CollectionState {}

class CollectionInitial extends CollectionState {}

class CollectionLoading extends CollectionState {}

class CollectionLoaded extends CollectionState {
  final List<Collection> collections;

  CollectionLoaded(this.collections);
}

class CollectionError extends CollectionState {
  final String message;

  CollectionError(this.message);
}
