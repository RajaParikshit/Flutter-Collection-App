import 'dart:async';

import 'package:collection_app/models/agent_model.dart';
import 'package:collection_app/models/repository_response.dart';
import 'package:collection_app/network/nao/agent_nao.dart';
import 'package:flutter/foundation.dart';

class AgentRepository{

  static const int ADD_AGENT_ERROR_CODE_INVALID_USER_CODE = 1;

  var _addAgentResponseController = StreamController<RepositoryResponse>.broadcast();

  factory AgentRepository() => AgentRepository._internal();

  AgentRepository._internal();

  void addAgent({@required AgentModel agent}){
    AgentNAO().addAgent(agent: agent).then((addAgentResponse){
      _addAgentResponseController.add(addAgentResponse);
    });
  }

  Stream<RepositoryResponse> getAgentAddResponse() => _addAgentResponseController.stream;

  void dispose(){
    _addAgentResponseController.close();
  }

}