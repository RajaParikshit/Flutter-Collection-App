import 'package:collection_app/app/app.dart';
import 'package:collection_app/databases/entity/client_collection_entity.dart';
import 'package:collection_app/models/client_model.dart';
import 'package:collection_app/repository/client_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/generated/i18n.dart';

class ViewCollectionViewModel{

  static ViewCollectionViewModel _instance;

  ClientRepository _clientRepository;

  ClientModel client;

  DateTime startDate;
  DateTime endDate;

  factory ViewCollectionViewModel({@required App app, @required ClientModel client}) {
    _instance ??= ViewCollectionViewModel._internal(clientRepository: app.getClientRepository(),
        client: client);
    return _instance;
  }

  ViewCollectionViewModel._internal({@required ClientRepository clientRepository, @required ClientModel client}){
    this._clientRepository = clientRepository;
    this.client = client;
    this.endDate = DateTime.now();
    this.startDate = DateTime(this.endDate.year, this.endDate.month - 1, this.endDate.day);
    _init();
  }

  void _init(){

  }

  void onStartDateChanged(DateTime newStartDate){
    startDate = newStartDate;
    requestClientCollectionList();
  }

  void onEndDateChanged(DateTime newEndDate){
    endDate = newEndDate;
    requestClientCollectionList();
  }

  void requestClientCollectionList(){
    _clientRepository.requestClientCollectionList(accountNo: client.accountNumber, startDate: startDate.millisecondsSinceEpoch, endDate: endDate.millisecondsSinceEpoch);
  }

  Stream<List<ClientCollectionEntity>> getClientCollectionList() => _clientRepository.getClientCollectionList();

  void dispose(){
   _instance = null;
   client = null;
   _clientRepository.dispose();
  }

}