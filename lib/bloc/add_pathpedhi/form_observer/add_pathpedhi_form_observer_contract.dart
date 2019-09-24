
import 'package:flutter/cupertino.dart';

abstract class AddPathpedhiFormObserverContract{

  Sink get name;
  Sink get address1;
  Sink get address2;
  Sink get address3;
  Sink get pin;
  Sink get phone;

  Stream<bool> get isValidName;
  Stream<bool> get isValidAddress1;
  Stream<bool> get isValidAddress2;
  Stream<bool> get isValidAddress3;
  Stream<bool> get isValidPin;
  Stream<bool> get isValidPhone;
  Stream<bool> get isAddPathpedhiEnabled;

  Stream<String> get nameErrorText;
  Stream<String> get address1ErrorText;
  Stream<String> get address2ErrorText;
  Stream<String> get address3ErrorText;
  Stream<String> get pinErrorText;
  Stream<String> get phoneErrorText;

  void invalidName({@required String nameErrorText});
  void invalidAddress1({@required String address1ErrorText});
  void invalidAddress2({@required String address2ErrorText});
  void invalidAddress3({@required String address3ErrorText});
  void invalidPin({@required String pinErrorText});
  void invalidPhone({@required String phoneErrorText});

  bool checkIsValidName(String name);
  bool checkIsValidAddress(String address);
  bool checkIsValidPin(String pin);
  bool checkIsValidPhone(String phone);
  bool checkIsAllCompulsoryParamsValid();

  void handlePathpedhiAddProcess();

  void dispose();

}