

import 'dart:async';

import 'package:collection_app/app/app.dart';
import 'package:collection_app/bloc/add_agent/form_observer/add_agent_form_observer_bloc.dart';
import 'package:collection_app/models/agent_model.dart';
import 'package:collection_app/repository/agent_repository.dart';
import 'package:flutter/widgets.dart';

class AddAgentViewModel{

  AddAgentFormObserverBloc _addAgentFormObserverBloc;
  AgentRepository _agentRepository;

  var _addAgentResponseController = StreamController<void>.broadcast();
  var _isLoadingController = StreamController<bool>.broadcast();
  var _canExitController = StreamController<bool>.broadcast();

  static AddAgentViewModel _instance;

  final agentNameController = TextEditingController();
  final agentCodeController = TextEditingController();
  final agentPasswordController = TextEditingController();
  final accountCodeController = TextEditingController();

  factory AddAgentViewModel(App app){
    _instance ??=
        AddAgentViewModel._internal(
            addAgentFormObserverBloc: AddAgentFormObserverBloc(),
            agentRepository: app.getAgentRepository()
        );
    return _instance;
  }

  AddAgentViewModel._internal({@required AddAgentFormObserverBloc addAgentFormObserverBloc,
  @required AgentRepository agentRepository}){
    this._addAgentFormObserverBloc = addAgentFormObserverBloc;
    this._agentRepository = agentRepository;
    _init();
  }

  void _init(){
    agentNameController.addListener(()=>
    getAddAgentFormObserver().agentName.add(agentNameController.text));

    agentCodeController.addListener(()=>
    getAddAgentFormObserver().agentCode.add(agentCodeController.text));

    agentPasswordController.addListener(()=>
    getAddAgentFormObserver().agentPassword.add(agentPasswordController.text));

    accountCodeController.addListener(()=>
    getAddAgentFormObserver().accountCode.add(accountCodeController.text));

    _isLoadingController.add(false);

    _listenAddAgentResponse();
  }

  AddAgentFormObserverBloc getAddAgentFormObserver() => _addAgentFormObserverBloc;

  void addAgent(){
    _isLoadingController.add(true);
    _agentRepository.addAgent(agent: AgentModel(
        accountCode: accountCodeController.text,
        agentCode: agentCodeController.text,
        agentName: agentNameController.text,
        agentPassword: agentPasswordController.text
    ));
  }

  void _listenAddAgentResponse(){
    _agentRepository.getAgentAddResponse()
        .listen((addAgentResponse){
          _isLoadingController.add(false);

          if(addAgentResponse.result){
            _addAgentResponseController.add(null);
          }
          else{
            switch(addAgentResponse.errorCode){
              case AgentRepository.ADD_AGENT_ERROR_CODE_INVALID_USER_CODE : {
                _addAgentFormObserverBloc.invalidAgentCode(agentCodeErrorText: addAgentResponse.message);
                break;
              }
            }
          }

    });
  }

  Stream<bool> isLoading() => _isLoadingController.stream;

  Stream<void> onSuccessfulAddAgent() => _addAgentResponseController.stream;

  bool checkIsEmpty() => accountCodeController.text.length == 0 && agentCodeController.text.length == 0
      && agentNameController.text.length == 0 && agentPasswordController.text.length == 0;


  void onExit(){
     _canExitController.add(checkIsEmpty());
  }

  Stream<bool> onCanExit() => _canExitController.stream;

  void dispose(){
    _instance = null;
    _addAgentFormObserverBloc.dispose();
    _agentRepository.dispose();
    _addAgentResponseController.close();
    _canExitController.close();
    _isLoadingController.close();
    agentNameController.clear();
    agentCodeController.clear();
    agentPasswordController.clear();
    accountCodeController.clear();
  }

}