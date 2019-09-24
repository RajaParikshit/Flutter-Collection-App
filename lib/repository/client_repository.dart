import 'dart:async';

import 'package:collection_app/databases/app_database.dart';
import 'package:collection_app/databases/entity/client_entity.dart';
import 'package:collection_app/models/client_collection_model.dart';
import 'package:collection_app/models/repository_response.dart';
import 'package:meta/meta.dart';

class ClientRepository{

  AppDatabase _appDatabase;
  var _clientListByName = StreamController<List<ClientEntity>>.broadcast();
  var _addClientCollectionResponseController = StreamController<RepositoryResponse>.broadcast();


  factory ClientRepository(Future<AppDatabase> appDatabase) => ClientRepository._internal(appDatabase);


  ClientRepository._internal(Future<AppDatabase> appDatabase){
    appDatabase.then((appDatabase){
      _appDatabase = appDatabase;
    });
  }

  void addCollection({@required ClientCollectionModel clientCollection}){
      _appDatabase.clientCollectionEntityDao.insertClientCollection(clientCollection).then((_){

      });
  }

  Stream<RepositoryResponse> getAddClientCollectionResponse() => _addClientCollectionResponseController.stream;

  void dispose(){
    _addClientCollectionResponseController.close();
  }

}