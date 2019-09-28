import 'dart:async';

import 'package:collection_app/databases/app_database.dart';
import 'package:collection_app/databases/entity/client_collection_entity.dart';
import 'package:collection_app/databases/entity/client_entity.dart';
import 'package:collection_app/models/repository_response.dart';
import 'package:meta/meta.dart';

class ClientRepository{

  AppDatabase _appDatabase;
  bool isDatabaseAvailable = false;
  var _clientList = StreamController<List<ClientEntity>>.broadcast();
  var _clientCollectionList = StreamController<List<ClientCollectionEntity>>.broadcast();
  var _addClientCollectionResponseController = StreamController<RepositoryResponse>.broadcast();
  var _onDatabaseAvailable = StreamController<void>.broadcast();

  factory ClientRepository(Future<AppDatabase> appDatabase) => ClientRepository._internal(appDatabase);

  ClientRepository._internal(Future<AppDatabase> appDatabase){
    appDatabase.then((appDatabase){
      _appDatabase = appDatabase;
      _onDatabaseAvailable.add(null);
    });
  }

  void addCollection({@required ClientCollectionEntity clientCollection}){
      _appDatabase.clientCollectionEntityDao.insertClientCollection(clientCollection).then((_){

        _appDatabase.clientEntityDao.getClientByAccountNo(clientCollection.accountNumber)
            .then((clientEntity){
              clientEntity.balance += clientCollection.amount;
              _appDatabase.clientEntityDao.updateClient(clientEntity).then((_){
                _addClientCollectionResponseController.add(
                    RepositoryResponse(result: true, message: "Collection added successfully", data: clientEntity.balance)
                );
              });
        });
      });
  }

  void requestClientList(){
    if(isDatabaseAvailable){
      _appDatabase.clientEntityDao.getAllClients().listen((clientList){
        _clientList.add(clientList);
      });
    }else{
      _onDatabaseAvailable.stream.listen((_){
        isDatabaseAvailable = true;
        _appDatabase.clientEntityDao.getAllClients().listen((clientList){
          _clientList.add(clientList);
        });
      });
    }
  }

  void requestClientCollectionList({@required String accountNo, @required int startDate, @required int endDate}){
    if (isDatabaseAvailable){
      _appDatabase.clientCollectionEntityDao.getClientCollection(accountNo, startDate, endDate).listen((clientCollectionList){
        _clientCollectionList.add(clientCollectionList);
      });
    }else{
      _onDatabaseAvailable.stream.listen((_){
        isDatabaseAvailable = true;
        _appDatabase.clientCollectionEntityDao.getClientCollection(accountNo, startDate, endDate).listen((clientCollectionList){
          _clientCollectionList.add(clientCollectionList);
        });
      });
    }
  }

  Stream<List<ClientEntity>> getClientList() => _clientList.stream;

  Stream<List<ClientCollectionEntity>> getClientCollectionList() => _clientCollectionList.stream;

  Stream<RepositoryResponse> getAddClientCollectionResponse() => _addClientCollectionResponseController.stream;

  void dispose(){
    _appDatabase = null;
    _addClientCollectionResponseController.close();
    _onDatabaseAvailable.close();
    _clientList.close();
    _clientCollectionList.close();
  }

}