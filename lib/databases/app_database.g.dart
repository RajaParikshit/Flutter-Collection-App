// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final database = _$AppDatabase();
    database.database = await database.open(name ?? ':memory:', _migrations);
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ClientEntityDao _clientEntityDaoInstance;

  ClientCollectionEntityDao _clientCollectionEntityDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);
      },
      onCreate: (database, _) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `clients` (`id` INTEGER, `account_number` TEXT NOT NULL, `balance` REAL, `client_name` TEXT, PRIMARY KEY (`id`, `account_number`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `client_collection` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `account_number` TEXT NOT NULL, `amount` REAL NOT NULL, `date` INTEGER NOT NULL, FOREIGN KEY (`account_number`) REFERENCES `clients` (`account_number`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE INDEX `index_clients_account_number` ON `clients` (`account_number`)');
        await database.execute(
            'CREATE INDEX `index_client_collection_account_number` ON `client_collection` (`account_number`)');
      },
    );
  }

  @override
  ClientEntityDao get clientEntityDao {
    return _clientEntityDaoInstance ??=
        _$ClientEntityDao(database, changeListener);
  }

  @override
  ClientCollectionEntityDao get clientCollectionEntityDao {
    return _clientCollectionEntityDaoInstance ??=
        _$ClientCollectionEntityDao(database, changeListener);
  }
}

class _$ClientEntityDao extends ClientEntityDao {
  _$ClientEntityDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _clientEntityInsertionAdapter = InsertionAdapter(
            database,
            'clients',
            (ClientEntity item) => <String, dynamic>{
                  'id': item.id,
                  'account_number': item.accountNumber,
                  'balance': item.balance,
                  'client_name': item.name
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final _clientsMapper = (Map<String, dynamic> row) => ClientEntity(
      row['id'] as int,
      row['account_number'] as String,
      row['balance'] as String,
      row['client_name'] as double);

  final InsertionAdapter<ClientEntity> _clientEntityInsertionAdapter;

  @override
  Future<List<ClientEntity>> getAllClients() async {
    return _queryAdapter.queryList('SELECT * FROM clients',
        mapper: _clientsMapper);
  }

  @override
  Future<List<ClientEntity>> getClientByName(String name) async {
    return _queryAdapter.queryList('SELECT * FROM clients WHERE name LIKE %?',
        arguments: <dynamic>[name], mapper: _clientsMapper);
  }

  @override
  Future<void> deleteAllClient() async {
    await _queryAdapter.queryNoReturn('DELETE FROM clients');
  }

  @override
  Future<void> deleteClient(int id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM clients WHERE id = ?',
        arguments: <dynamic>[id]);
  }

  @override
  Future<void> insertBulkClients(List<ClientEntity> clientsList) async {
    await _clientEntityInsertionAdapter.insertList(
        clientsList, sqflite.ConflictAlgorithm.replace);
  }

  @override
  Future<void> insertClient(ClientEntity clientEntity) async {
    await _clientEntityInsertionAdapter.insert(
        clientEntity, sqflite.ConflictAlgorithm.replace);
  }
}

class _$ClientCollectionEntityDao extends ClientCollectionEntityDao {
  _$ClientCollectionEntityDao(this.database, this.changeListener)
      : _clientCollectionEntityInsertionAdapter = InsertionAdapter(
            database,
            'client_collection',
            (ClientCollectionEntity item) => <String, dynamic>{
                  'id': item.id,
                  'account_number': item.accountNumber,
                  'amount': item.amount,
                  'date': item.date
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<ClientCollectionEntity>
      _clientCollectionEntityInsertionAdapter;

  @override
  Future<void> insertClientCollection(
      ClientCollectionEntity clientCollection) async {
    await _clientCollectionEntityInsertionAdapter.insert(
        clientCollection, sqflite.ConflictAlgorithm.ignore);
  }
}
