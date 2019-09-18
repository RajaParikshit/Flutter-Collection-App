import 'dart:async';

import 'package:collection_app/databases/app_database.dart';
import 'package:collection_app/databases/entity/client_entity.dart';
import 'package:meta/meta.dart';

class ClientRepository{

  AppDatabase _appDatabase;
  var _clientListByName = StreamController<List<ClientEntity>>.broadcast();


  factory ClientRepository({@required AppDatabase appDatabase}) => ClientRepository._internal(appDatabase);


  ClientRepository._internal(this._appDatabase){

  }



}