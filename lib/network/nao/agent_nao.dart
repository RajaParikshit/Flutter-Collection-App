
import 'package:collection_app/models/agent_model.dart';
import 'package:collection_app/models/repository_response.dart';
import 'package:collection_app/network/network_endpoints.dart';
import 'package:collection_app/utils/network_util.dart';
import 'package:flutter/foundation.dart';

import '../network_config.dart';

class AgentNAO{

  Future<RepositoryResponse> addAgent({@required AgentModel agent}) =>
      NetworkUtil().post(
          url: NetworkEndpoints.ADD_AGENT_API,
          body: agent.toJson()
      ).then(
              (response) => RepositoryResponse.fromJson(response)
      );

  Future<RepositoryResponse> getClientOfAgent({@required String agentCode}) =>
      NetworkUtil().post(
          url: NetworkEndpoints.GET_CLIENTS_OF_AGENT,
          body: {
            NetworkConfig.API_KEY_AGENT_CODE: agentCode,
          }
      ).then((response){
        return RepositoryResponse.fromJson(response);
      });

}