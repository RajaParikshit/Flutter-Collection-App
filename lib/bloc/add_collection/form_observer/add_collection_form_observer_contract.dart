
import 'package:flutter/cupertino.dart';

abstract class AddCollectionFormObserverContract {

  Sink get amount;

  Stream<bool> get isValidAmount;
  Stream<bool> get isAddCollectionEnabled;

  Stream<String> get amountErrorText;

  void invalidAmount({@required String amountErrorText});

  bool checkIsValidAmount(double amount);
  bool checkIsAllCompulsoryParamsValid();

  void handleAddCollectionProcess();

  void dispose();

}