
import 'dart:async';

import 'package:collection_app/bloc/add_pathpedhi/form_observer/add_pathpedhi_form_observer_contract.dart';
import 'package:collection_app/resource/values/app_strings.dart';

class AddPathpedhiFormObserverBloc implements AddPathpedhiFormObserverContract{

  static const int PATHPEDHI_NAME_VALID_NAMES = 3;
  static const int PATHPEDHI_ADDRESS_WORDS = 2;
  static const int PATHPEDHI_PIN_VALID_LENGTH = 6;
  static const int PATHPEDHI_PHONE_VALID_LENGTH = 10;

  var _nameController = StreamController<String>.broadcast();
  var _address1Controller = StreamController<String>.broadcast();
  var _address2Controller = StreamController<String>.broadcast();
  var _address3Controller = StreamController<String>.broadcast();
  var _pinController = StreamController<String>.broadcast();
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
    if(address != null && address.split(" ").length >= PATHPEDHI_ADDRESS_WORDS &&
        address.split(" ")[PATHPEDHI_ADDRESS_WORDS - 1] != ""){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  bool checkIsValidName(String name) {
    if(name != null && name.split(" ").length >= PATHPEDHI_NAME_VALID_NAMES &&
        name.split(" ")[PATHPEDHI_NAME_VALID_NAMES - 1] != ""){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  bool checkIsValidPhone(String phone) {
    if(phone != null && phone.length >= PATHPEDHI_PHONE_VALID_LENGTH){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  bool checkIsValidPin(String pin) => pin != null && pin.length == PATHPEDHI_PIN_VALID_LENGTH;

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
      isValidName ? invalidName(nameErrorText: null) : invalidName();
    });
    isValidAddress1.listen((isValidAddress1){
      _tempIsValidAddress1 = isValidAddress1;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
      isValidAddress1 ? invalidAddress1(address1ErrorText: null) : invalidAddress1();
    });
    isValidAddress2.listen((isValidAddress2){
      _tempIsValidAddress2 = isValidAddress2;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
      isValidAddress2 ? invalidAddress2(address2ErrorText: null) : invalidAddress2();
    });
    isValidAddress3.listen((isValidAddress3){
      _tempIsValidAddress3 = isValidAddress3;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
      isValidAddress3 ? invalidAddress3(address3ErrorText: null) : invalidAddress3();
    });
    isValidPin.listen((isValidPin){
      _tempIsValidPin = isValidPin;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
      isValidPin ? invalidPin(pinErrorText: null) : invalidPin();
    });
    isValidPhone.listen((isValidPhone){
      _tempIsValidPhone= isValidPhone;
      _isPathpedhiAddEnabledController.add(checkIsAllCompulsoryParamsValid());
      isValidPhone ? invalidPhone(phoneErrorText: null) : invalidPhone();
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
  void invalidAddress1({String address1ErrorText = AppStrings.ADD_PATHPEDHI_ADDRESS1_ERROR}) {
      _address1ErrorTextController.add(address1ErrorText);
  }

  @override
  void invalidAddress2({String address2ErrorText = AppStrings.ADD_PATHPEDHI_ADDRESS2_ERROR}) {
      _address2ErrorTextController.add(address2ErrorText);
  }

  @override
  void invalidAddress3({String address3ErrorText = AppStrings.ADD_PATHPEDHI_ADDRESS3_ERROR}) {
      _address3ErrorTextController.add(address3ErrorText);
  }

  @override
  void invalidName({String nameErrorText = AppStrings.ADD_PATHPEDHI_NAME_ERROR}) {
      _nameErrorTextController.add(nameErrorText);
  }

  @override
  void invalidPhone({String phoneErrorText = AppStrings.ADD_PATHPEDHI_PHONE_ERROR}) {
      _phoneErrorTextController.add(phoneErrorText);
  }

  @override
  void invalidPin({String pinErrorText = AppStrings.ADD_PATHPEDHI_PIN_ERROR}) {
      _pinErrorTextController.add(pinErrorText);
  }

  @override
  bool checkIsAllCompulsoryParamsValid() => _tempIsValidName & _tempIsValidAddress1 & _tempIsValidAddress2 & _tempIsValidAddress3 & _tempIsValidPin & _tempIsValidPhone;

}