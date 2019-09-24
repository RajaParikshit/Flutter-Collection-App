import 'dart:async';

import 'package:collection_app/models/pathpedhi_model.dart';
import 'package:collection_app/models/repository_response.dart';
import 'package:collection_app/network/nao/pathpedhi_nao.dart';
import 'package:flutter/cupertino.dart';

class PathpedhiRepository {

  static const int ADD_PATHPEDHI_ERROR_CODE_ALREADY_EXIST = 1;

  var _pathpedhiAddResponseController = StreamController<RepositoryResponse>.broadcast();

  factory PathpedhiRepository() => PathpedhiRepository._internal();

  PathpedhiRepository._internal();

  void addPathpedhi({@required PathpedhiModel pathpedhi}){
    PathpedhiNAO.addPathpedhi(pathpedhi: pathpedhi)
        .then((pathpedhiAddResponse){
          _pathpedhiAddResponseController.add(pathpedhiAddResponse);
    });
  }

  Stream<RepositoryResponse> getPathpedhiAddResponse(){
    return _pathpedhiAddResponseController.stream;
  }

  void dispose(){
    _pathpedhiAddResponseController.close();
  }

}