
import 'dart:async';

import 'package:collection_app/bloc/add_pathpedhi/form_observer/add_pathpedhi_form_observer_contract.dart';

class AddPathpedhiFormObserverBloc implements AddPathpedhiFormObserverContract{

  var _nameController = StreamController<String>.broadcast();
  var _address1Controller = StreamController<String>.broadcast();
  var _address2Controller = StreamController<String>.broadcast();
  var _address3Controller = StreamController<String>.broadcast();
  var _pinController = StreamController<int>.broadcast();
  var _phoneController = StreamController<String>.broadcast();

  var _isPathpedhiAddEnabledController = StreamController<bool>.broadcast();

  var _nameErrorTextController = StreamController<String>.broadcast();
  var _address1ErrorTextController = StreamController<String>.broadcast();
  var _address2ErrorTextController = StreamController<String>.broadcast();
  var _address3ErrorTextController = StreamController<String>.broadcast();
  var _pinErrorTextController = StreamController<String>.broadcast();
  var _phoneErrorTextController = StreamController<String>.broadcast();

  bool _tempIsValidName, _tempIsValidAddress1, _tempIsValidAddress2, _tempIsValidAddress3, _tempIsValidPin, _tempIsValidPhone;

  AddPathpedhiFormObserverBloc(){
    _tempIsValidName = _tempIsValidAddress1 = _tempIsValidAddress2 = _tempIsValidAddress3 = _tempIsValidPin = _tempIsValidPhone = false;
    handlePathpedhiAddProcess();
  }

  @override
  Sink get address1 => _address1Controller;

  @override
  Stream<String> get address1ErrorText => _address1ErrorTextController.stream;

  @override
  Sink get address2 => _address2Controller;

  @override
  Stream<String> get address2ErrorText => _address2ErrorTextController.stream;

  @override
  Sink get address3 => _address3Controller;

  @override
  Stream<String> get address3ErrorText => _address3ErrorTextController.stream;

  @override
  bool checkIsValidAddress(String address) {
    // TODO: implement checkIsValidAddress
    return null;
  }

  @override
  bool checkIsValidName(String name) {
    // TODO: implement checkIsValidName
    return null;
  }

  @override
  bool checkIsValidPhone(String phone) {
    // TODO: implement checkIsValidPhone
    return null;
  }

  @override
  bool checkIsValidPin(int pin) {
    // TODO: implement checkIsValidPin
    return null;
  }

  @override
  void dispose() {
    _nameController.close();
    _address1Controller.close();
    _address2Controller.close();
    _address3Controller.close();
    _pinController.close();
    _phoneController.close();
    _isPathpedhiAddEnabledController.close();
    _nameErrorTextController.close();
    _address1ErrorTextController.close();
    _address2ErrorTextController.close();
    _address3ErrorTextController.close();
    _pinErrorTextController.close();
    _phoneErrorTextController.close();
  }

  @override
  void handlePathpedhiAddProcess() {
    isValidName.listen((isValidName){
      _tempIsValidName = isValidName;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
    });
    isValidAddress1.listen((isValidAddress1){
      _tempIsValidAddress1 = isValidAddress1;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
    });
    isValidAddress2.listen((isValidAddress2){
      _tempIsValidAddress2 = isValidAddress2;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
    });
    isValidAddress3.listen((isValidAddress3){
      _tempIsValidAddress3 = isValidAddress3;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
    });
    isValidPin.listen((isValidPin){
      _tempIsValidPin = isValidPin;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
    });
    isValidPhone.listen((isValidPhone){
      _tempIsValidPhone= isValidPhone;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
    });
  }

  @override
  Stream<bool> get isAddPathpedhiEnabled => _isPathpedhiAddEnabledController.stream;

  @override
  Stream<bool> get isValidAddress1 => _address1Controller.stream.map(checkIsValidAddress);

  @override
  Stream<bool> get isValidAddress2 => _address2Controller.stream.map(checkIsValidAddress);

  @override
  Stream<bool> get isValidAddress3 => _address3Controller.stream.map(checkIsValidAddress);

  @override
  Stream<bool> get isValidName => _nameController.stream.map(checkIsValidName);

  @override
  Stream<bool> get isValidPhone => _phoneController.stream.map(checkIsValidPhone);

  @override
  Stream<bool> get isValidPin => _pinController.stream.map(checkIsValidPin);

  @override
  Sink get name => _nameController;

  @override
  Stream<String> get nameErrorText => _nameErrorTextController.stream;

  @override
  Sink get phone => _phoneController;

  @override
  Stream<String> get phoneErrorText => _phoneErrorTextController.stream;

  @override
  Sink get pin => _pinController;

  @override
  Stream<String> get pinErrorText => _pinErrorTextController.stream;

  @override
  void invalidAddress1({String address1ErrorText}) {
      _address1ErrorTextController.add(address1ErrorText);
  }

  @override
  void invalidAddress2({String address2ErrorText}) {
      _address2ErrorTextController.add(address2ErrorText);
  }

  @override
  void invalidAddress3({String address3ErrorText}) {
      _address3ErrorTextController.add(address3ErrorText);
  }

  @override
  void invalidName({String nameErrorText}) {
      _nameErrorTextController.add(nameErrorText);
  }

  @override
  void invalidPhone({String phoneErrorText}) {
      _phoneErrorTextController.add(phoneErrorText);
  }

  @override
  void invalidPin({String pinErrorText}) {
      _pinErrorTextController.add(pinErrorText);
  }

  @override
  bool checkIsAllCompulsoryParamsValid() => _tempIsValidName & _tempIsValidAddress1 & _tempIsValidAddress2 & _tempIsValidAddress3 & _tempIsValidPin & _tempIsValidPhone;

}