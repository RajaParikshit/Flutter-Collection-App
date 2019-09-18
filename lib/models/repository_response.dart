
import 'package:collection_app/bloc/models/repository_response_model.dart';
import 'package:collection_app/network/network_config.dart';
import 'package:flutter/cupertino.dart';

class RepositoryResponse implements RepositoryResponseModelContract{
  @override
  var data;

  @override
  int errorCode;

  @override
  String message;

  @override
  bool result;

  RepositoryResponse({@required this.result, @required this.message, this.data, this.errorCode});

  RepositoryResponse.fromJson(dynamic json){
    this.result = json[NetworkConfig.API_KEY_RESULT];
    this.message = json[NetworkConfig.API_KEY_MESSAGE];
    this.data = json[NetworkConfig.API_KEY_DATA];
    this.errorCode = json[NetworkConfig.API_KEY_ERROR_CODE];
  }

}