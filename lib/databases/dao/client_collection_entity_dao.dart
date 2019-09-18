import 'dart:async';

import 'package:collection_app/databases/entity/client_collection_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ClientCollectionEntityDao{

  @Insert(onConflict: OnConflictStrategy.IGNORE)
  Future<void> insertClientCollection(ClientCollectionEntity clientCollection);

}