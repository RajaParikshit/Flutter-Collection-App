import 'dart:async';

import 'package:collection_app/app/app_executors.dart';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/client_collection_entity_dao.dart';
import 'dao/client_entity_dao.dart';
import 'entity/client_collection_entity.dart';
import 'entity/client_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [ClientEntity, ClientCollectionEntity])
abstract class AppDatabase extends FloorDatabase {

  static Future<AppDatabase> _instance;

  static const String DATABASE_NAME = "collection_app.sqlite";

  ClientEntityDao get clientEntityDao;

  ClientCollectionEntityDao get clientCollectionEntityDao;

  StreamController<bool> _databaseCreatedStream = new StreamController.broadcast();

  static Future<AppDatabase> getInstance(final AppExecutor appExecutor) {
    if (_instance == null) {
        _instance = _buildDatabase(appExecutor).then((appDatabase){
          appDatabase.updateDatabaseCreated();
          return appDatabase;
        });
    }
    return _instance;
  }

  static Future<AppDatabase> _buildDatabase(final AppExecutor appExecutor) {
    return $FloorAppDatabase
        .databaseBuilder(AppDatabase.DATABASE_NAME)
        .build()
        .then((database) {
          //Add some initial scripts
      return database;
    });
  }

  void updateDatabaseCreated() async {
    sqflite.databaseExists(join(await sqflite.getDatabasesPath(), AppDatabase.DATABASE_NAME))
        .then((isDatabaseExist){
      if (isDatabaseExist){
        _setDatabaseCreated();
      }
    });
  }

  void _setDatabaseCreated(){
    _databaseCreatedStream.add(true);
  }

  Future<bool> getDatabaseCreated(){
    return _databaseCreatedStream.stream.first;
  }

}
