import 'dart:async';

import 'package:collection_app/app/app.dart';
import 'package:collection_app/bloc/login/form_observer/login_form_observer_bloc.dart';
import 'package:collection_app/repository/login_repository.dart';
import 'package:flutter/material.dart';

/// Login View Model Class -> View-model class for Login View
class LoginViewModel {
  // -------------------------------------------------------- Variables -----------------------------------------------------------------------------

  // LoginFormObserver object
  LoginFormObserverBLOC _loginFormObserver;

  // LoginRepository object
  LoginRepository _loginRepository;

  // LoginViewModel instance
  static LoginViewModel _instance;

  // TextEditingController for userName
  final userIDController = TextEditingController();

  // TextEditingController for userPassword
  final userPasswordController = TextEditingController();

  // STREAM CONTROLLER for broadcasting login response
  var _loginResponseController = StreamController<void>.broadcast();

  var _isLoadingController = StreamController<bool>.broadcast();

  // ---------------------------------------------------------- Constructor --------------------------------------------------------------------------

  /// LoginViewModel Factory Constructor -> LoginViewModel
  /// @dependency -> App
  /// @usage -> Returns LoginViewModel Singleton-Instance by injecting dependency for private constructor.
  factory LoginViewModel(App app) {
    // Check whether instance is NULL otherwise get the instance from private constructor
    _instance ??= // NULL Check
        // _instance is NULL. Create instance by injecting dependency to private internal constructor.
        LoginViewModel._internal(
            loginFormObserver: LoginFormObserverBLOC(),
            loginRepository: app.getLoginRepository(
                appPreferences: app.getAppPreferences()));
    // Return Singleton-Instance of LoginViewModel
    return _instance;
  }

  /// LoginViewModel Private Constructor -> LoginViewModel
  /// @param -> @required loginFormObserver -> LoginFormObserver
  ///        -> @required loginRepository -> LoginRepository
  /// @usage -> Initialize private variables and invoke _init() method
  LoginViewModel._internal(
      {@required LoginFormObserverBLOC loginFormObserver,
      @required LoginRepository loginRepository}) {
    // Initialize loginFormObserver
    _loginFormObserver = loginFormObserver;

    // Initialize loginRepository
    _loginRepository = loginRepository;

    // init method for initializing view-model process
    _init();
  }

  // ---------------------------------------------------------- View Model Methods -------------------------------------------------------------------

  /// Init method -> void
  /// @param -> _
  /// @usage -> Initiate all listeners for view-model
  void _init() {
    // Add listener to userNameController
    userIDController.addListener(() =>
        // Add userNameController's value to userName SINK from LoginFormObserver
        getLoginFormObserver().userCode.add(userIDController.text));

    // Add listener to userPasswordController
    userPasswordController.addListener(() =>
        // Add userPasswordController's value to userPassword SINK from LoginFormObserver
        getLoginFormObserver().userPassword.add(userPasswordController.text));

    // Add login response listener
    _listenLoginResponse();

    // Repository validation in not initiated yet
    _isLoadingController.add(false);
  }

  /// Listen Login Response Method -> void
  /// @param -> _
  /// @usage -> Subscribe to getLoginResponse() method from LoginRepository.
  void _listenLoginResponse() {

    _loginRepository.getLoginResponse().listen((loginResponse) {

      _isLoadingController.add(false);
      _isLoadingController.add(false);

      if (loginResponse.result) {
        // Successful login
        _loginResponseController.add(null);
      } else {
        // Unsuccessful login
        // Invoke invalidCredentials() method of loginFormObserver
        switch (loginResponse.errorCode) {
          case LoginRepository.LOGIN_ERROR_CODE_INVALID_USER_ID:
            {
              _loginFormObserver.invalidUserID(errorMsg: loginResponse.message);
              break;
            }
          case LoginRepository.LOGIN_ERROR_CODE_INVALID_PASSWORD:
            {
              _loginFormObserver.invalidUserPassword(
                  errorMsg: loginResponse.message);
            }
        }
      }
    });
  }

  // --------------------------------------------------------------------- Getter Methods --------------------------------------------------------------
  /// GETTER LoginFormObserver Method -> LoginFormObserver
  /// @param -> _
  /// @usage -> Returns the current object of loginFormObserver
  LoginFormObserverBLOC getLoginFormObserver() => _loginFormObserver;

  // --------------------------------------------------------------- View Models Methods For Views -----------------------------------------------------

  /// CheckLogin Method -> void
  /// @param -> None
  ///  @usage -> Initiate process of checking login credentials by passing username and password to repository
  void checkLogin() {
    // Get userName from userNameController
    // Get userPassword from userPasswordController
    _isLoadingController.add(true);
    _loginRepository.isAuthenticUser(
        userID: userIDController.text,
        userPassword: userPasswordController.text);
  }

  void resetCredentialsInput() {
    userIDController.clear();
    userPasswordController.clear();
  }

  /// Get Login Response Method -> Stream<bool>
  /// @param -> _
  /// @usage -> Stream method for streaming login response.
  Stream<void> onSuccessfulLogin() => _loginResponseController
      .stream; // Stream the loginResponseController's stream

  Stream<bool> isLoading() =>
      _isLoadingController.stream; // Stream the isLoadingController Response

  void dispose() {
    // Invoke dispose() method of loginFormObserver
    _loginFormObserver.dispose();
    // Invoke dispose() method of loginRepository
    _loginRepository.dispose();

    _isLoadingController.close();
    userIDController.clear();
    userPasswordController.clear();
    _instance = null;
  }
}
