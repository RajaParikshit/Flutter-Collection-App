

import 'package:collection_app/bloc/models/agent_model.dart';
import 'package:collection_app/network/network_config.dart';
import 'package:flutter/foundation.dart';

class AgentModel implements AgentModelContract{
  @override
  String accountCode;

  @override
  String agentCode;

  @override
  String agentName;

  @override
  String agentPassword;

  AgentModel({@required this.accountCode, @required this.agentCode,
              @required this.agentName, this.agentPassword});

  AgentModel.fromJson(dynamic json){
    this.accountCode = json[NetworkConfig.API_KEY_AGENT_ACCOUNT_CODE].toString();
    this.agentCode = json[NetworkConfig.API_KEY_AGENT_CODE];
    this.agentName = json[NetworkConfig.API_KEY_AGENT_NAME];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      NetworkConfig.API_KEY_AGENT_NAME : this.agentName,
      NetworkConfig.API_KEY_AGENT_CODE : this.agentCode,
      NetworkConfig.API_KEY_AGENT_ACCOUNT_CODE : this.accountCode,
      NetworkConfig.API_KEY_AGENT_PASSWORD : this.agentPassword,
    };
  }



}