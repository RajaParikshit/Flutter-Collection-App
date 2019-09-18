import 'dart:async';

import 'package:collection_app/databases/app_preferences.dart';
import 'package:collection_app/models/repository_response.dart';
import 'package:meta/meta.dart';

import 'package:collection_app/network/nao/login_nao.dart';

/// Login Repository -> Repository Class for Login process
class LoginRepository {

  static const int LOGIN_ERROR_CODE_INVALID_USER_ID = 1;
  static const int LOGIN_ERROR_CODE_INVALID_PASSWORD = 2;

  //--------------------------------------------------------------------- Variables -------------------------------------------------------------------
  // STREAM CONTROLLER for broadcasting success of login process
  var _loginResponseController = StreamController<RepositoryResponse>.broadcast();

  // AppPreferences private object
  AppPreferences _appPreferences;

  //-------------------------------------------------------------------- Constructors ------------------------------------------------------------------

  /// Login Repository Factory Constructor -> LoginRepository
  /// @dependency -> @required appPreferences -> AppPreferences
  /// @usage -> Returns LoginRepository instance by injecting dependencies for private constructor.
  factory LoginRepository({@required AppPreferences appPreferences})=> LoginRepository._internal(appPreferences);

  /// Login Repository Private Constructor -> LoginRepository
  /// @param -> @required appPreference -> AppPreferences
  /// @usage -> Create Instance of LoginRepository and initialize variables
  LoginRepository._internal(this._appPreferences);

  //---------------------------------------------------------------------- Methods --------------------------------------------------------------------
  /// Is Authentic User Method -> void
  /// @param -> @required userName -> String
  ///        -> @required userPassword -> String
  /// @usage -> Initiate authentication process and listen to response of authentication, therefore notify authentication result to all listeners
  void isAuthenticUser(
      {@required String userID, @required String userPassword}) {

//    Timer(Duration(seconds: 2), ()=>{
//      _isSuccessfulLogin.add(true)
//    });

    // Here we are authenticating user over network
    // Invoke Login Network Access Object's static isAuthenticUser() method
    LoginNAO.isAuthenticUser(userID: userID, userPassword: userPassword)

        .then((loginResponse) {// On Response
          // Check Login Response
          if (loginResponse.result) {// Successful login
            // Set IS_LOGGED_IN to TRUE in preference
            _appPreferences.setLoggedIn(isLoggedIn: true);
          } else {// Unsuccessful login
            // Set IS_LOGGED_IN to FALSE in preference
            _appPreferences.setLoggedIn(isLoggedIn: false);
          }
          // Add loginResponse event to _loginResponseController stream
          _loginResponseController.add(loginResponse);
        });
  }

  /// Get Login Response Method -> Stream<bool>
  /// @param -> _
  /// @usage -> Stream of type RepositoryResponse for streaming login response
  Stream<RepositoryResponse> getLoginResponse() {
    return _loginResponseController.stream;
  }

  void dispose(){
    _loginResponseController.close();
  }

}
