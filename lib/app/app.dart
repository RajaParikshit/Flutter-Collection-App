import 'dart:async';

import 'package:collection_app/app/app_routes.dart';
import 'package:collection_app/databases/app_database.dart';
import 'package:collection_app/repository/agent_repository.dart';
import 'package:collection_app/repository/client_repository.dart';
import 'package:collection_app/repository/dashboard_repository.dart';
import 'package:collection_app/repository/pathpedhi_repository.dart';
import 'package:collection_app/resource/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:collection_app/databases/app_preferences.dart';
import 'package:collection_app/repository/login_repository.dart';

import 'app_executors.dart';

/// App Class -> Application Class
class App extends StatelessWidget {
  //-------------------------------------------------------------- Singleton-Instance --------------------------------------------------------------
  // Singleton-Instance
  static final App _instance = App._internal();

  /// App Private Constructor -> App
  /// @param -> _
  /// @usage -> Create Instance of App
  App._internal();

  /// App Factory Constructor -> App
  /// @dependency -> _
  /// @usage -> Returns the instance of app
  factory App() => _instance;

  //------------------------------------------------------------ Widget Methods --------------------------------------------------------------------

  /// @override Build Method -> Widget
  /// @param -> context -> BuildContext
  /// @returns -> Returns widget as MaterialApp class instance
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppStyles.lightTheme(),
      onGenerateRoute: getAppRoutes().getRoutes,
    );
  }

  //------------------------------------------------------------- App Methods -------------------------------------------------------------------------

  /// Get App Routes Method -> AppRoutes
  /// @param -> _
  /// @usage -> Returns the instance of AppRoutes class
  AppRoutes getAppRoutes(){
    return AppRoutes();
  }

  AppExecutor getAppExecutor(){
    return AppExecutor();
  }

  /// Get App Preferences Method -> AppPreferences
  /// @param -> _
  /// @usage -> Returns the instance of AppPreferences class
  AppPreferences getAppPreferences(){
    return AppPreferences();
  }

  Future<AppDatabase> getAppDatabase(){
    return AppDatabase.getInstance();
  }


  /// Get Login Repository Method -> LoginRepository
  /// @param -> appPreferences -> AppPreferences
  /// @usage -> Returns the instance of LoginRepository class by injecting AppPreferences dependency
  LoginRepository getLoginRepository({@required AppPreferences appPreferences}){
    return LoginRepository(appPreferences: appPreferences);
  }

  PathpedhiRepository getPathpedhiRepository(){
    return PathpedhiRepository();
  }

  AgentRepository getAgentRepository(){
    return AgentRepository();
  }

  ClientRepository getClientRepository(){
    return ClientRepository(getAppDatabase());
  }

  DashboardRepository getDashboardRepository({@required AppPreferences appPreferences, @required Future<AppDatabase> appDatabase}){
    return DashboardRepository(appPreferences: appPreferences, appDatabase: appDatabase);
  }

}

