import 'dart:async';

import 'package:collection_app/bloc/add_agent/form_observer/add_agent_form_observer_contract.dart';
import 'package:collection_app/resource/values/app_strings.dart';

class AddAgentFormObserverBloc implements AddAgentFormObserverContract{

  static const int AGENT_CODE_VALID_LENGTH = 5;
  static const int AGENT_NAME_VALID_NAMES = 2;
  static const int AGENT_PASSWORD_VALID_LENGTH = 8;
  static const int ACCOUNT_CODE_VALID_LENGTH = 5;

  var _agentCodeController = StreamController<String>.broadcast();
  var _agentNameController = StreamController<String>.broadcast();
  var _agentPasswordController = StreamController<String>.broadcast();
  var _accountCodeController = StreamController<String>.broadcast();
  var _isAddAgentEnabledController = StreamController<bool>.broadcast();

  var _agentCodeErrorTextController = StreamController<String>.broadcast();
  var _agentNameErrorTextController = StreamController<String>.broadcast();
  var _agentPasswordErrorTextController = StreamController<String>.broadcast();
  var _accountCodeErrorTextController = StreamController<String>.broadcast();

  bool _tempIsValidAgentCode, _tempIsValidAgentName, _tempIsValidAgentPassword, _tempIsValidAccountCode;

  AddAgentFormObserverBloc(){
    _tempIsValidAgentCode = _tempIsValidAgentName = _tempIsValidAgentPassword = _tempIsValidAccountCode = false;
    handleAddAgentProcess();
  }

  @override
  Sink get accountCode => _accountCodeController;

  @override
  Stream<String> get accountCodeErrorText => _accountCodeErrorTextController.stream;

  @override
  Sink get agentCode => _agentCodeController;

  @override
  Stream<String> get agentCodeErrorText => _agentCodeErrorTextController.stream;

  @override
  Sink get agentName => _agentNameController;

  @override
  Stream<String> get agentNameErrorText => _agentNameErrorTextController.stream;

  @override
  Sink get agentPassword => _agentPasswordController;

  @override
  Stream<String> get agentPasswordErrorText => _agentPasswordErrorTextController.stream;

  @override
  bool checkIsAllCompulsoryParamsValid() => _tempIsValidAgentCode & _tempIsValidAgentName & _tempIsValidAgentPassword & _tempIsValidAccountCode;

  @override
  bool checkIsValidAccountCode(String accountCode) {
    if (accountCode != null && accountCode.length == ACCOUNT_CODE_VALID_LENGTH){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  bool checkIsValidAgentCode(String agentCode) {
    if (agentCode != null && agentCode.length == AGENT_CODE_VALID_LENGTH){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  bool checkIsValidAgentName(String name) {
    if (name != null && name.split(" ").length >= AGENT_NAME_VALID_NAMES &&
        name.split(" ")[AGENT_NAME_VALID_NAMES - 1] != ""){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  bool checkIsValidAgentPassword(String password) {
    if (password !=null && password.length >= AGENT_PASSWORD_VALID_LENGTH){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  void dispose() {
    _agentNameController.close();
    _agentCodeController.close();
    _agentPasswordController.close();
    _accountCodeController.close();

    _isAddAgentEnabledController.close();

    _agentNameErrorTextController.close();
    _agentCodeErrorTextController.close();
    _agentPasswordErrorTextController.close();
    _accountCodeErrorTextController.close();
  }

  @override
  void handleAddAgentProcess() {
    isValidAgentCode.listen((isValidAgentCode){
      _tempIsValidAgentCode = isValidAgentCode;
      _isAddAgentEnabledController.add(checkIsAllCompulsoryParamsValid());
      isValidAgentCode ? invalidAgentCode(agentCodeErrorText: null) : invalidAgentCode();
    });
    isValidAgentName.listen((isValidAgentName){
      _tempIsValidAgentName = isValidAgentName;
      _isAddAgentEnabledController.add(checkIsAllCompulsoryParamsValid());
      isValidAgentName ? invalidAgentName(agentNameErrorText: null) : invalidAgentName();
    });
    isValidAgentPassword.listen((isValidAgentPassword){
      _tempIsValidAgentPassword = isValidAgentPassword;
      _isAddAgentEnabledController.add(checkIsAllCompulsoryParamsValid());
      isValidAgentPassword ? invalidAgentPassword(agentPasswordErrorText: null): invalidAgentPassword();
    });
    isValidAccountCode.listen((isValidAccountCode){
      _tempIsValidAccountCode = isValidAccountCode;
      _isAddAgentEnabledController.add(checkIsAllCompulsoryParamsValid());
      isValidAccountCode ? invalidAccountCode(accountCodeErrorText: null): invalidAccountCode();
    });
  }

  @override
  Stream<bool> get isAddAgentEnabled => _isAddAgentEnabledController.stream;

  @override
  Stream<bool> get isValidAccountCode => _accountCodeController.stream.map(checkIsValidAccountCode);

  @override
  Stream<bool> get isValidAgentCode => _agentCodeController.stream.map(checkIsValidAgentCode);

  @override
  Stream<bool> get isValidAgentName => _agentNameController.stream.map(checkIsValidAgentName);

  @override
  Stream<bool> get isValidAgentPassword => _agentPasswordController.stream.map(checkIsValidAgentPassword);

  @override
  void invalidAccountCode({String accountCodeErrorText = AppStrings.ADD_AGENT_ACCOUNT_CODE_ERROR_MSG}) {
      _accountCodeErrorTextController.add(accountCodeErrorText);
  }

  @override
  void invalidAgentCode({String agentCodeErrorText = AppStrings.ADD_AGENT_CODE_ERROR_MSG}) {
      _agentCodeErrorTextController.add(agentCodeErrorText);
  }

  @override
  void invalidAgentName({String agentNameErrorText = AppStrings.ADD_AGENT_NAME_ERROR_MSG}) {
      _agentNameErrorTextController.add(agentNameErrorText);
  }

  @override
  void invalidAgentPassword({String agentPasswordErrorText = AppStrings.ADD_AGENT_PASSWORD_ERROR_MSG}) {
     _agentPasswordErrorTextController.add(agentPasswordErrorText);
  }

}