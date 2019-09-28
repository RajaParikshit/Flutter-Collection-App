import 'dart:async';

import 'package:collection_app/databases/entity/client_collection_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ClientCollectionEntityDao{

  @Insert(onConflict: OnConflictStrategy.IGNORE)
  Future<void> insertClientCollection(ClientCollectionEntity clientCollection);
  
  @Query("SELECT * FROM client_collection WHERE account_number = :accountNo AND date >= :startDate AND date <= :endDate")
  Stream<List<ClientCollectionEntity>> getClientCollection(accountNo, startDate, endDate);

}