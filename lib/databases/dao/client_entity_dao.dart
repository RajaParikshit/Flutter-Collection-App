import 'dart:async';
import 'package:collection_app/databases/entity/client_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ClientEntityDao{

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertBulkClients(List<ClientEntity> clientsList);

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertClient(ClientEntity clientEntity);

  @Query("SELECT * FROM clients")
  Future<List<ClientEntity>> getAllClients();

  @Query("SELECT * FROM clients WHERE name LIKE %:name%")
  Future<List<ClientEntity>> getClientByName(String name);

  @Query("DELETE FROM clients")
  Future<void> deleteAllClient();

  @Query("DELETE FROM clients WHERE id = :id")
  Future<void> deleteClient(int id);

}