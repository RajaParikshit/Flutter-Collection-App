import 'dart:async';
import 'package:collection_app/bloc/add_collection/form_observer/add_collection_form_observer_contract.dart';

class AddCollectionFormObserverBloc implements AddCollectionFormObserverContract{

  var _amountController = StreamController<double>.broadcast();
  var _isAddCollectionEnabled = StreamController<bool>.broadcast();
  var _amountErrorTextController = StreamController<String>.broadcast();

  bool _tempIsValidAmount;

  AddCollectionFormObserverBloc(){
    _tempIsValidAmount = false;
    handleAddCollectionProcess();
  }

  @override
  Sink get amount => _amountController;

  @override
  Stream<String> get amountErrorText => _amountErrorTextController.stream;

  @override
  bool checkIsAllCompulsoryParamsValid() => _tempIsValidAmount;

  @override
  bool checkIsValidAmount(double amount) {
    // TODO: implement checkIsValidAmount
    return null;
  }

  @override
  void dispose() {
    _amountController.close();
    _amountErrorTextController.close();
    _isAddCollectionEnabled.close();
  }

  @override
  void handleAddCollectionProcess() {
    isValidAmount.listen((isValidAmount){
      _tempIsValidAmount = isValidAmount;
      _isAddCollectionEnabled.add(checkIsAllCompulsoryParamsValid());
      isValidAmount ? invalidAmount(amountErrorText: null) : invalidAmount();
    });
  }

  @override
  Stream<bool> get isAddCollectionEnabled => _isAddCollectionEnabled.stream;

  @override
  Stream<bool> get isValidAmount => _amountController.stream.map(checkIsValidAmount);

  @override
  void invalidAmount({String amountErrorText}) {
      _amountErrorTextController.add(amountErrorText);
  }

}