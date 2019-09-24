import 'dart:async';

import 'package:collection_app/app/app.dart';
import 'package:collection_app/bloc/add_pathpedhi/form_observer/add_pathpedhi_form_observer_bloc.dart';
import 'package:collection_app/models/pathpedhi_model.dart';
import 'package:collection_app/repository/pathpedhi_repository.dart';
import 'package:flutter/widgets.dart';

class AddPathpedhiViewModel{

  AddPathpedhiFormObserverBloc _addPathpedhiFormObserverBloc;
  PathpedhiRepository _pathpedhiRepository;

  var _addPathpedhiResponseController = StreamController<void>.broadcast();
  var _isLoadingController = StreamController<bool>.broadcast();
  var _canExitController = StreamController<bool>.broadcast();

  static AddPathpedhiViewModel _instance;

  final nameController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final address3Controller = TextEditingController();
  final pinController = TextEditingController();
  final phoneController = TextEditingController();

  factory AddPathpedhiViewModel(App app){
    _instance ??=
        AddPathpedhiViewModel._internal(
            pathpedhiFormObserverBloc: AddPathpedhiFormObserverBloc(),
            pathpedhiRepository: app.getPathpedhiRepository());

    return _instance;
  }

  AddPathpedhiViewModel._internal({@required AddPathpedhiFormObserverBloc pathpedhiFormObserverBloc,
  @required PathpedhiRepository pathpedhiRepository}){
    this._addPathpedhiFormObserverBloc = pathpedhiFormObserverBloc;
    this._pathpedhiRepository = pathpedhiRepository;
    _init();
  }

  void _init(){
    nameController.addListener(()=>
    getAddPathpedhiFormObserver().name.add(nameController.text));

    address1Controller.addListener(()=>
    getAddPathpedhiFormObserver().address1.add(address1Controller.text));

    address2Controller.addListener(()=>
    getAddPathpedhiFormObserver().address2.add(address2Controller.text));

    address3Controller.addListener(()=>
    getAddPathpedhiFormObserver().address3.add(address3Controller.text));

    pinController.addListener(()=>
    getAddPathpedhiFormObserver().pin.add(pinController.text));

    phoneController.addListener(()=>
    getAddPathpedhiFormObserver().phone.add(phoneController.text));

    _isLoadingController.add(false);

    _listenAddPathpedhiResponse();
  }


  AddPathpedhiFormObserverBloc getAddPathpedhiFormObserver() => _addPathpedhiFormObserverBloc;

  void addPathpedhi(){
    _isLoadingController.add(true);
    _pathpedhiRepository.addPathpedhi(pathpedhi: PathpedhiModel(
      name: nameController.text,
      address1: address1Controller.text,
      address2: address2Controller.text,
      address3: address3Controller.text,
      pin: int.tryParse(pinController.text) ?? -1,
      phone: phoneController.text,
    ));
  }

  void _listenAddPathpedhiResponse(){
    _pathpedhiRepository.getPathpedhiAddResponse().listen((addPathpedhiResponse){

      _isLoadingController.add(false);

      if (addPathpedhiResponse.result){
        _addPathpedhiResponseController.add(null);
      }else{
        switch(addPathpedhiResponse.errorCode){
          case PathpedhiRepository.ADD_PATHPEDHI_ERROR_CODE_ALREADY_EXIST : {
            _addPathpedhiFormObserverBloc.invalidName(nameErrorText: addPathpedhiResponse.message);
            break;
          }
        }
      }
    });
  }

  Stream<bool> isLoading() => _isLoadingController.stream;

  Stream<void> onSuccessfulAddPathpedhi() => _addPathpedhiResponseController.stream;

  bool checkIsEmpty() => nameController.text.length == 0 && address1Controller.text.length == 0
      && address2Controller.text.length == 0 && address3Controller.text.length == 0
      && pinController.text.length == 0 && phoneController.text.length == 0;


  void onExit(){
    _canExitController.add(checkIsEmpty());
  }

  Stream<bool> onCanExit() => _canExitController.stream;

  void dispose(){
    _instance = null;
    _addPathpedhiFormObserverBloc.dispose();
    _pathpedhiRepository.dispose();
    _addPathpedhiResponseController.close();
    _isLoadingController.close();
    _canExitController.close();
    nameController.clear();
    address1Controller.clear();
    address2Controller.clear();
    address3Controller.clear();
    pinController.clear();
    phoneController.clear();
  }

}