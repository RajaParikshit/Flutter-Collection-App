import 'dart:async';

/// Login Form Observer Abstract Class - A contract class for Login Form Observer
abstract class LoginFormObserverContract {

  // ---------------------------------------------------------- Contract Variables ---------------------------------------------------------------

  // SINK variables
  /// User Code Variable -> Sink
  /// @usage -> Sink for user name value
  Sink get userCode;
  /// User Password Variable -> Sink
  /// @usage -> Sink for user password value
  Sink get userPassword;

  // STREAM variables
  /// Is Valid User Name Variable -> Stream<bool>
  /// @usage -> Stream of type bool for streaming validation result of user name
  Stream<bool> get isValidUserID;
  /// Is Valid User Password Variable -> Stream<bool>
  /// @usage -> Stream of type bool for streaming validation result of user password
  Stream<bool> get isValidUserPassword;
  /// Is Login Enabled Variable -> Stream<bool>
  /// @usage -> Stream of type bool for streaming whether login is enabled or not
  Stream<bool> get isLoginEnabled;
  /// User Name Error Text Variable -> Stream<String>
  /// @usage -> Stream of type String for streaming user name error
  Stream<String> get userIDErrorText;
  /// User Password Error Text Variable -> Stream<String>
  /// @usage -> Stream of type String for streaming user password error
  Stream<String> get userPasswordErrorText;

  //-------------------------------------------------------- Contract Methods -------------------------------------------------------------------------

  //Receiver Methods
  /// Dispose Method -> void
  /// @param -> _
  /// @usage -> Dispose the state of LoginFormObserver
  void dispose();

  /// Invalid Credentials Method -> void
  /// @param -> _
  /// @usage -> Initiate process for invalid UserID
  void invalidUserID();

  /// Invalid Credentials Method -> void
  /// @param -> _
  /// @usage -> Initiate process for invalid UserPassword
  void invalidUserPassword();

  /// Handle Login Enable Process Method -> void
  /// @param -> _
  /// @usage -> Handle process of enabling login
  void handleLoginEnableProcess();

  /// Check Valid User ID Method -> bool
  /// @param -> userID -> String
  /// @usage -> Validating user name
  //Validation Methods
  bool checkValidUserID(String userID);

  /// Check Valid User Password Method -> bool
  /// @param -> userPassword -> String
  /// @usage -> Validating user password
  bool checkValidUserPassword(String userPassword);

}