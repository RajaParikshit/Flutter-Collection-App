

import 'dart:async';

import 'package:collection_app/app/app.dart';
import 'package:collection_app/repository/dashboard_repository.dart';
import 'package:flutter/foundation.dart';

class DashboardViewModel{

  DashboardRepository _dashboardRepository;

  static DashboardViewModel _instance;

  bool _isSuperUser;

  var _isLoadingController = StreamController<bool>.broadcast();

  factory DashboardViewModel({@required App app}){
    _instance ??=
      DashboardViewModel._internal(dashboardRepository: app.getDashboardRepository(
          appPreferences: app.getAppPreferences(), appDatabase: app.getAppDatabase()));

    return _instance;
  }

  DashboardViewModel._internal({@required DashboardRepository dashboardRepository}){
    this._dashboardRepository = dashboardRepository;
    _init();
  }

  void _init(){
    checkIsSuperUser();
  }


  Stream<bool> isLoading() =>
      _isLoadingController.stream;

  void checkIsSuperUser(){
    _isLoadingController.add(true);
    _dashboardRepository.isSuperUser().then((isSuperUser){
      _isLoadingController.add(false);
        this._isSuperUser = isSuperUser;
    });
  }

  Stream<bool> isImportEnabled(){
    return _dashboardRepository.isImportEnabled();
  }

  bool isSuperUser(){
    return this._isSuperUser;
  }

  void logout(){
    _dashboardRepository.logout();
    dispose();
  }

  void dispose(){
    _instance = null;
    _isLoadingController.close();
    _dashboardRepository.dispose();
    _dashboardRepository = null;
  }

}