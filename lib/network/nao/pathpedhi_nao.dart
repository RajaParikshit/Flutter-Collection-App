import 'package:collection_app/models/pathpedhi_model.dart';
import 'package:collection_app/models/repository_response.dart';
import 'package:collection_app/network/network_endpoints.dart';
import 'package:collection_app/utils/network_util.dart';
import 'package:flutter/cupertino.dart';

class PathpedhiNAO{
  static Future<RepositoryResponse> addPathpedhi({@required PathpedhiModel pathpedhi}) =>
      NetworkUtil().post(
          url: NetworkEndpoints.ADD_PATHPEDHI_API,
          body: pathpedhi.toJson()
      ).then((dynamic response){
        return RepositoryResponse.fromJson(response);
      });
}