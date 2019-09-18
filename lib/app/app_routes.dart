import 'package:collection_app/views/add_agent_view.dart';
import 'package:collection_app/views/add_collection_view.dart';
import 'package:collection_app/views/add_pathpedhi_view.dart';
import 'package:collection_app/views/client_list_view.dart';
import 'package:collection_app/views/dashboard_view.dart';
import 'package:collection_app/views/deposit_collection_view.dart';
import 'package:collection_app/views/login_view.dart';
import 'package:collection_app/views/splash_view.dart';
import 'package:collection_app/views/view_collection_view.dart';
import 'package:flutter/material.dart';

/// App Routes Class -> Routing class
class AppRoutes{

  //-------------------------------- Constants ---------------------------------

  static const String APP_ROUTE_LOGIN = "/login";
  static const String APP_ROUTE_DASHBOARD = "/dashboard";
  static const String APP_ROUTE_CLIENT_LIST = "/client_list";
  static const String APP_ROUTE_ADD_COLLECTION = "/add_collection";
  static const String APP_ROUTE_VIEW_COLLECTION = "/view_collection";
  static const String APP_ROUTE_DEPOSIT_COLLECTION = "/deposit_collection";
  static const String APP_ROUTE_ADD_AGENT = "/add_agent";
  static const String APP_ROUTE_ADD_PATHPEDHI = "/add_pathpedhi";

  //---------------------------------- Methods ---------------------------------

  /// Get Routes Method -> Route
  /// @param -> routeSettings -> RouteSettings
  /// @usage -> Returns route based on requested route settings
  Route getRoutes(RouteSettings routeSettings){

    switch(routeSettings.name){

      case APP_ROUTE_LOGIN : {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => LoginView(),
          fullscreenDialog: true,
        );
      }

      case APP_ROUTE_DASHBOARD : {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => DashboardView(),
        );
      }

      case APP_ROUTE_CLIENT_LIST : {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => ClientListView(),
        );
      }

      case APP_ROUTE_ADD_COLLECTION : {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => AddCollectionView(),
        );
      }

      case APP_ROUTE_VIEW_COLLECTION : {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => ViewCollectionView(),
        );
      }

      case APP_ROUTE_DEPOSIT_COLLECTION : {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => DepositCollectionView(),
        );
      }

      case APP_ROUTE_ADD_AGENT : {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => AddAgentView(),
        );
      }

      case APP_ROUTE_ADD_PATHPEDHI : {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => AddPathpedhiView(),
        );
      }

      default: {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => SplashView(),
          fullscreenDialog: true,
        );
      }

    }

  }

}



