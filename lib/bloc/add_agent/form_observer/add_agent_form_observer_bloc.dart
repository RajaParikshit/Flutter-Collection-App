import 'dart:async';

import 'package:collection_app/bloc/add_agent/form_observer/add_agent_form_observer_contract.dart';

class AddAgentFormObserverBloc implements AddAgentFormObserverContract{

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
    // TODO: implement checkIsValidAccountCode
    return null;
  }

  @override
  bool checkIsValidAgentCode(String agentCode) {
    // TODO: implement checkIsValidAgentCode
    return null;
  }

  @override
  bool checkIsValidAgentName(String name) {
    // TODO: implement checkIsValidAgentName
    return null;
  }

  @override
  bool checkIsValidAgentPassword(String password) {
    // TODO: implement checkIsValidAgentPassword
    return null;
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
  void invalidAccountCode({String accountCodeErrorText}) {
      _accountCodeErrorTextController.add(accountCodeErrorText);
  }

  @override
  void invalidAgentCode({String agentCodeErrorText}) {
      _agentCodeErrorTextController.add(agentCodeErrorText);
  }

  @override
  void invalidAgentName({String agentNameErrorText}) {
      _agentNameErrorTextController.add(agentNameErrorText);
  }

  @override
  void invalidAgentPassword({String agentPasswordErrorText}) {
     _agentPasswordErrorTextController.add(agentPasswordErrorText);
  }

}