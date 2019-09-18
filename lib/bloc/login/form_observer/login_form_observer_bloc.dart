import 'dart:async';

import 'package:collection_app/bloc/login/form_observer/login_form_observer_contract.dart';
import 'package:collection_app/resource/values/app_strings.dart';


/// Login Form Observer Class - Observer class implementing LoginFormObserverContract
class LoginFormObserverBLOC implements LoginFormObserverContract{

  //------------------------------------------------------------ Static Constants ------------------------------------------------------------------
  static const int USER_ID_VALID_LENGTH = 3;
  static const int USER_PASSWORD_VALID_LENGTH = 8;

  //------------------------------------------------------------ Observer variables -----------------------------------------------------------------

  // STREAM CONTROLLERS
  /// User Name StreamController -> String
  /// @usage -> Control stream of user name by adding sink from 'userID sink' and providing stream of user name
  var _userIDController = StreamController<String>.broadcast();
  /// User Password StreamController -> String
  /// @usage -> Control stream of user password by adding sink from 'userPassword sink' and providing stream of user password
  var _userPasswordController = StreamController<String>.broadcast();
  /// User Name Error Message StreamController -> String
  /// @usage -> Control stream of user name error msg
  var _userIDErrorMsgController = StreamController<String>.broadcast();
  /// User Password Error Message StreamController -> String
  /// @usage -> Control stream of user password error msg
  var _userPasswordErrorMsgController = StreamController<String>.broadcast();
  /// Is Login Valid Toggle StreamController -> bool
  /// @usage -> Control stream of valid login toggle
  var _isLoginValidToggleController = StreamController<bool>.broadcast();

  // bool variable to temporarily store result of username and password validation
  bool _tempValidUserID, _tempValidUserPassword;

  //------------------------------------------------------------- Constructor -----------------------------------------------------------------------

  LoginFormObserverBLOC():super(){
    // Initially invalidate temporary user name and password
    _tempValidUserID = _tempValidUserPassword = false;

    // Init handleLoginEnableProcess
    handleLoginEnableProcess();
  }

  //------------------------------------------------------------- Contract Observer Methods ---------------------------------------------------------

  @override
  void handleLoginEnableProcess() {

    // Listen to _isValidUserName stream
    isValidUserID.listen(
            (isValidUserID){
                if(isValidUserID){ // Valid user name
                  // Set temporary valid user name to TRUE i.e. set it valid
                  _tempValidUserID = true;
                  // Now check whether temporary user password is Valid
                  _tempValidUserPassword
                      ? // Conditional operator
                  // VALID
                  // Add TRUE event to isLoginValidToggle stream
                  _isLoginValidToggleController.add(true)
                      :
                  // INVALID
                  // Do nothing
                  // ignore: unnecessary_statements
                  null;
                  // ADD NULL event to userNameErrorMsg stream
                  _userIDErrorMsgController.add(null);
                }else{ // Invalid User Name
                  // Set temporary valid user name to FALSE i.e. set it invalid
                  _tempValidUserID = false;
                  // Add FALSE event to isLoginValidToggle stream
                  _isLoginValidToggleController.add(false);
                  // ADD user name error string event to userNameErrorMsg stream
                  _userIDErrorMsgController.add(AppStrings.LOGIN_USER_ID_ERROR_MSG);
                }
    });

    // Listen to _isValidUserPassword stream
    isValidUserPassword.listen(
            (isValidUserPassword){
              if(isValidUserPassword){// Valid user password
                // Set temporary valid user password to TRUE i.e. set it valid
                _tempValidUserPassword = true;
                // Now check whether temporary user name is Valid
                _tempValidUserID
                    ? // Conditional operator
                // VALID
                // Add TRUE event to isLoginValidToggle stream
                _isLoginValidToggleController.add(true)
                    :
                //INVALID
                // Do nothing
                // ignore: unnecessary_statements
                null;
                // ADD NULL event to userPasswordErrorMsg stream
                _userPasswordErrorMsgController.add(null);
              }else{
                // Set temporary valid user password to FALSE i.e. set it invalid
                _tempValidUserPassword = false;
                // Add FALSE event to isLoginValidToggle stream
                _isLoginValidToggleController.add(false);
                // ADD user password error string event to userPasswordErrorMsg stream
                _userPasswordErrorMsgController.add(AppStrings.LOGIN_USER_PASSWORD_ERROR_MSG);
              }

    });
  }

  //----------------------------------------------------------- Contract Variables ----------------------------------------------------------------
  @override
  // Read the stream from userNameController and map it to bool with _checkValidUserName() method by skipping first n elements of stream
  // where n = User ID valid length
  Stream<bool> get isValidUserID => _userIDController.stream.skip(USER_ID_VALID_LENGTH).map(checkValidUserID);

  @override
  // Read the stream from userPasswordController and map it to bool with _checkValidUserPassword() method by skipping first n elements of stream
  // where n = User password valid length
  Stream<bool> get isValidUserPassword => _userPasswordController.stream.skip(USER_PASSWORD_VALID_LENGTH).map(checkValidUserPassword);

  @override
  // Read stream from _isLoginValidToggleController
  Stream<bool> get isLoginEnabled =>  _isLoginValidToggleController.stream;

  @override
  // Write userName sink to _userNameController
  Sink get userCode => _userIDController;

  @override
  // Read userNameErrorText stream from _userNameErrorMsgController
  Stream<String> get userIDErrorText => _userIDErrorMsgController.stream;

  @override
  // Write userPassword sink to _userPasswordController
  Sink get userPassword => _userPasswordController;

  @override
  // Read userPasswordErrorText stream from _userPasswordErrorMsgController
  Stream<String> get userPasswordErrorText => _userPasswordErrorMsgController.stream;


  //------------------------------------------------------- Contract Validation Methods --------------------------------------------------------------

  @override
  // Valid user id string if it is not NULL and its length is greater than defined valid user id length
  bool checkValidUserID(String userID) => userID != null && userID.length >= USER_ID_VALID_LENGTH;

  @override
  // Valid user password string if it is not NULL and its length is greater than defined valid user password length
  bool checkValidUserPassword(String userPassword)=> userPassword != null && userPassword.length >= USER_PASSWORD_VALID_LENGTH;


  //--------------------------------------------------------- Contract Receiver Methods --------------------------------------------------------------

  @override
  void dispose() {
    // Close all stream controllers so that there listener could stop listening
    _userIDController.close();
    _userPasswordController.close();
    _userIDErrorMsgController.close();
    _userPasswordErrorMsgController.close();
    _isLoginValidToggleController.close();
  }

  @override
  void invalidUserID({errorMsg = AppStrings.LOGIN_USER_ID_INVALID_MSG}) {
    // ADD user id invalid string event to userNameErrorMsg stream
    _userIDErrorMsgController.add(errorMsg);
  }

  @override
  void invalidUserPassword({errorMsg = AppStrings.LOGIN_USER_PASSWORD_INVALID_MSG}) {
    // ADD user password invalid string event to userPasswordErrorMsg stream
    _userPasswordErrorMsgController.add(errorMsg);
  }

}