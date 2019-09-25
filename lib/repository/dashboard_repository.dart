import 'dart:async';

import 'package:collection_app/databases/app_preferences.dart';
import 'package:collection_app/models/repository_response.dart';
import 'package:collection_app/network/nao/dashboard_nao.dart';
import 'package:collection_app/databases/app_database.dart';
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

  void importFromServer(){
    _appPreferences.getAgent().then((agent){
      DashboardNAO().getClientRecordsForAgent(agentCode: agent.agentCode)
          .then((clientRecordsResponse){
            if(clientRecordsResponse.result){

            }
            _isClientRecordsAdded.add(clientRecordsResponse);
      });
    });

  }

  Stream<RepositoryResponse> isClientRecordAdded() => _isClientRecordsAdded.stream;

  void dispose(){
    _appPreferences = null;
    _isClientRecordsAdded.close();
    _onDatabaseAvailable.close();
  }

  void logout(){
    _appPreferences.setLoggedIn(isLoggedIn: false);
  }

}