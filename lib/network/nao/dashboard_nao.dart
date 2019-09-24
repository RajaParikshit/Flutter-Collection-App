
import 'package:collection_app/models/repository_response.dart';
import 'package:collection_app/network/network_config.dart';
import 'package:collection_app/network/network_endpoints.dart';
import 'package:collection_app/utils/network_util.dart';
import 'package:flutter/cupertino.dart';

class DashboardNAO{

  Future<RepositoryResponse> getClientRecordsForAgent({@required String agentCode}) =>
      NetworkUtil().post(
          url: NetworkEndpoints.GET_COLLECTION_FOR_AGENT,
          body: {
            NetworkConfig.API_KEY_AGENT_CODE: agentCode,
          }
      ).then((response){
        return RepositoryResponse.fromJson(response);
      });

}