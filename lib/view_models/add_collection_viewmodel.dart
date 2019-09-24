

import 'dart:async';

import 'package:collection_app/app/app.dart';
import 'package:collection_app/bloc/add_collection/form_observer/add_collection_form_observer_bloc.dart';
import 'package:collection_app/models/client_collection_model.dart';
import 'package:collection_app/models/client_model.dart';
import 'package:collection_app/repository/client_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AddCollectionViewModel{

  AddCollectionFormObserverBloc _addCollectionFormObserverBloc;
  ClientRepository _clientRepository;

  static AddCollectionViewModel _instance;

  DateTime _collectionDate;

  ClientModel client;
  String collectionDateString;
  final amountController = TextEditingController();

  double addedAmount;
  double newBalance;

  var _addCollectionResponseController = StreamController<void>.broadcast();
  var _onAskForConfirmationController = StreamController<void>.broadcast();
  var _isLoadingController = StreamController<bool>.broadcast();


  factory AddCollectionViewModel(App app, ClientModel client){
    _instance ??=
        AddCollectionViewModel._internal(
            addCollectionFormObserverBloc: AddCollectionFormObserverBloc(),
            clientRepository: app.getClientRepository(),
            client: client,
            collectionDate: DateTime.now());

    return _instance;
  }

  AddCollectionViewModel._internal({@required AddCollectionFormObserverBloc addCollectionFormObserverBloc,
                    @required ClientRepository clientRepository, @required ClientModel client, @required DateTime collectionDate}){
    this._addCollectionFormObserverBloc = addCollectionFormObserverBloc;
    this._clientRepository = clientRepository;
    this.client = client;
    this._collectionDate = collectionDate;
    collectionDateString = DateFormat.yMMMMd().format(collectionDate);
    _init();
  }

  void _init(){
    amountController.addListener(()=>
    getAddCollectionFormObserver().amount.add(amountController.text));
    _isLoadingController.add(false);
    _listenAddCollectionResponse();
  }

  void onAddButtonClick(){
    addedAmount = double.parse(amountController.text);
    newBalance = client.balance + addedAmount;
    _onAskForConfirmationController.add(null);
  }

  void addCollection(){

    _isLoadingController.add(true);

    _clientRepository.addCollection(clientCollection: ClientCollectionModel(
        accountNumber: client.accountNumber,
        amount: addedAmount,
        date: _collectionDate.millisecondsSinceEpoch));
  }

  void _listenAddCollectionResponse(){
    _clientRepository.getAddClientCollectionResponse().listen((addCollectionResponse){
        _isLoadingController.add(false);
        if(addCollectionResponse.result){
          _addCollectionResponseController.add(null);
        }else{
          switch(addCollectionResponse.errorCode){

          }
        }
    });
  }

  AddCollectionFormObserverBloc getAddCollectionFormObserver() => _addCollectionFormObserverBloc;

  Stream<void> onSuccessfulAddCollection() => _addCollectionResponseController.stream;

  Stream<void> onAskForConfirmation() => _onAskForConfirmationController.stream;

  Stream<bool> isLoading() => _isLoadingController.stream;

  void dispose(){
    _instance = null;
    _addCollectionResponseController.close();
    _onAskForConfirmationController.close();
    amountController.clear();
  }

}