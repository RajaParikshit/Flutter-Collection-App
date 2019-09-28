import 'dart:async';

import 'package:collection_app/databases/app_preferences.dart';
import 'package:collection_app/databases/entity/client_entity.dart';
import 'package:collection_app/models/repository_response.dart';
import 'package:collection_app/network/nao/agent_nao.dart';
import 'package:collection_app/databases/app_database.dart';
import 'package:collection_app/network/network_config.dart';
import 'package:flutter/cupertino.dart';

class DashboardRepository{

  AppPreferences _appPreferences;
  AppDatabase _appDatabase;

  var _isClientRecordsAdded = StreamController<RepositoryResponse>.broadcast();
  var _onDatabaseAvailable = StreamController<void>.broadcast();

  factory DashboardRepository({@required AppPreferences appPreferences, @required Future<AppDatabase> appDatabase})
      => DashboardRepository._internal(appPreferences: appPreferences, appDatabase: appDatabase);

  DashboardRepository._internal({@required AppPreferences appPreferences, @required Future<AppDatabase> appDatabase}){
    this._appPreferences = appPreferences;
    appDatabase.then((database){
       _appDatabase = database;
       _onDatabaseAvailable.add(null);
    });
  }

  Future<bool> isSuperUser(){
    return _appPreferences.getIsSuperUser();
  }

  Stream<bool> isImportEnabled(){
    return _appPreferences.getIsImportEnabled().asStream();
  }

  void importClientsOfAgentFromServer(){
    _appPreferences.getAgent().then((agent){
      AgentNAO().getClientOfAgent(agentCode: agent.agentCode)
          .then((clientRecordsResponse){
            if(clientRecordsResponse.result){
                List<ClientEntity> clientsList = List();
                for(var i=0; i<clientRecordsResponse.data.length; i++){
                  var client = clientRecordsResponse.data[i];
                  clientsList.add(ClientEntity(
                      null,
                      client[NetworkConfig.API_KEY_CLIENT_ACCOUNT_NO].toString(),
                      client[NetworkConfig.API_KEY_CLIENT_BALANCE].toDouble(),
                      client[NetworkConfig.API_KEY_CLIENT_NAME],));
                }
                _appDatabase.clientEntityDao.insertBulkClients(clientsList).then((_){
                    _appPreferences.setIsImportEnabled(isImportEnabled: false);
                    _isClientRecordsAdded.add(clientRecordsResponse);
                });

            }
            else{
              _isClientRecordsAdded.add(clientRecordsResponse);
            }
      });
    });

  }

  Stream<RepositoryResponse> isClientRecordImported() => _isClientRecordsAdded.stream;

  void dispose(){
    _appPreferences = null;
    _isClientRecordsAdded.close();
    _onDatabaseAvailable.close();
  }

  void logout(){
    _appPreferences.setLoggedIn(isLoggedIn: false);
    _appPreferences.setIsImportEnabled(isImportEnabled: true);
  }

}