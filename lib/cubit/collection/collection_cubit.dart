import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drift/drift.dart';
import 'package:split_ease/database/app_database.dart';
import '../../database/daos/collection_dao.dart';
import 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final CollectionDao _collectionDao;
  StreamSubscription? _collectionsSubscription;

  CollectionCubit(this._collectionDao) : super(CollectionInitial()) {
    _watchCollections();
  }

  void _watchCollections() {
    emit(CollectionLoading());
    _collectionsSubscription?.cancel(); // Cancel previous subscription if any
    _collectionsSubscription = _collectionDao.watchAllCollections().listen(
          (collections) => emit(CollectionLoaded(collections)),
          onError: (e) => emit(CollectionError('Failed to observe collections: $e')),
        );
  }

  // fetchCollections is no longer needed if using watch
  /* Future<void> fetchCollections() async {
    try {
      emit(CollectionLoading());
      final collections = await _collectionDao.getAllCollections();
      emit(CollectionLoaded(collections));
    } catch (e) {
      emit(CollectionError('Failed to load collections: $e'));
    }
  } */

  Future<void> addCollection(String name, {String? description}) async {
    try {
      final newCollection = CollectionsCompanion(
        name: Value(name),
        description: description == null || description.isEmpty ? const Value.absent() : Value(description),
      );
      await _collectionDao.insertCollection(newCollection);
      // State will update automatically via the stream if watchAllCollections is used
    } catch (e) {
      // Consider how to handle errors without losing the current loaded list
      // For example, emit a specific error event or add an error field to CollectionLoaded
      emit(CollectionError('Failed to add collection: $e'));
    }
  }

  Future<void> deleteCollection(int id) async {
    try {
      await _collectionDao.deleteCollection(id);
      // State will update automatically via the stream
    } catch (e) {
      emit(CollectionError('Failed to delete collection: $e'));
    }
  }

  @override
  Future<void> close() {
    _collectionsSubscription?.cancel();
    return super.close();
  }
}
