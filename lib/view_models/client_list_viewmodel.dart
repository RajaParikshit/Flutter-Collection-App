

import 'package:collection_app/app/app.dart';
import 'package:collection_app/databases/entity/client_entity.dart';
import 'package:collection_app/repository/client_repository.dart';
import 'package:flutter/foundation.dart';

class ClientListViewModel{

  static ClientListViewModel _instance;
  ClientRepository _clientRepository;

  factory ClientListViewModel({@required App app}){
    _instance ??= ClientListViewModel._internal(clientRepository: app.getClientRepository());
    return _instance;
  }

  ClientListViewModel._internal({@required ClientRepository clientRepository}){
    _clientRepository = clientRepository;
  }

  void requestClientsList(){
    _clientRepository.requestClientList();
  }

  Stream<List<ClientEntity>> getClientsList() => _clientRepository.getClientList();

  void dispose(){
    _clientRepository.dispose();
    _instance = null;
  }

}
