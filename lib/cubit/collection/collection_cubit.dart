import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drift/drift.dart';
import 'package:split_ease/database/app_database.dart';
import '../../database/daos/collection_dao.dart';
import 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final CollectionDao _collectionDao;

  CollectionCubit(this._collectionDao) : super(CollectionInitial()) {
    // Optionally load collections immediately
    fetchCollections();
  }

  Future<void> fetchCollections() async {
    try {
      emit(CollectionLoading());
      final collections = await _collectionDao.getAllCollections();
      emit(CollectionLoaded(collections));
    } catch (e) {
      emit(CollectionError('Failed to load collections: $e'));
    }
  }

  Future<void> addCollection(String name, {String? description}) async {
    try {
      final newCollection = CollectionsCompanion(
        name: Value(name),
        description: Value(description),
      );
      await _collectionDao.insertCollection(newCollection);
      fetchCollections(); // reload after insert
    } catch (e) {
      emit(CollectionError('Failed to add collection: $e'));
    }
  }

  Future<void> deleteCollection(int id) async {
    try {
      await _collectionDao.deleteCollection(id);
      fetchCollections(); // reload after delete
    } catch (e) {
      emit(CollectionError('Failed to delete collection: $e'));
    }
  }
}
