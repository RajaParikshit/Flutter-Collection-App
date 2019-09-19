import 'package:flutter/cupertino.dart';

abstract class AddAgentFormObserverContract {

  Sink get agentCode;
  Sink get agentName;
  Sink get agentPassword;
  Sink get accountCode;

  Stream<bool> get isValidAgentCode;
  Stream<bool> get isValidAgentName;
  Stream<bool> get isValidAgentPassword;
  Stream<bool> get isValidAccountCode;
  Stream<bool> get isAddAgentEnabled;

  Stream<String> get agentCodeErrorText;
  Stream<String> get agentNameErrorText;
  Stream<String> get agentPasswordErrorText;
  Stream<String> get accountCodeErrorText;

  void invalidAgentCode({@required String agentCodeErrorText});
  void invalidAgentName({@required String agentNameErrorText});
  void invalidAgentPassword({@required String agentPasswordErrorText});
  void invalidAccountCode({@required String accountCodeErrorText});

  bool checkIsValidAgentCode(String agentCode);
  bool checkIsValidAgentName(String name);
  bool checkIsValidAgentPassword(String password);
  bool checkIsValidAccountCode(String accountCode);
  bool checkIsAllCompulsoryParamsValid();

  void handleAddAgentProcess();

  void dispose();

}