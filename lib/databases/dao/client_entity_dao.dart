import 'dart:async';
import 'package:collection_app/databases/entity/client_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ClientEntityDao{

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertBulkClients(List<ClientEntity> clientsList);

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertClient(ClientEntity clientEntity);

  @update
  Future<void> updateClient(ClientEntity clientEntity);

  @Query("SELECT * FROM clients")
  Stream<List<ClientEntity>> getAllClients();

  @Query("SELECT * FROM clients WHERE account_number = :accountNo")
  Future<ClientEntity> getClientByAccountNo(String accountNO);

  @Query("SELECT * FROM clients WHERE client_name LIKE %:name%")
  Stream<List<ClientEntity>> getClientByName(String name);

  @Query("SELECT * FROM clients WHERE account_number LIKE %:accountNO%")
  Stream<List<ClientEntity>> getClientByAccount(String accountNo);

  @Query("DELETE FROM clients")
  Future<void> deleteAllClient();

  @Query("DELETE FROM clients WHERE id = :id")
  Future<void> deleteClient(int id);

}