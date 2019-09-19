import 'package:collection_app/bloc/models/client_collection_model_contract.dart';
import 'package:flutter/foundation.dart';

class ClientCollectionModel implements ClientCollectionModelContract{
  @override
  String accountNumber;

  @override
  double amount;

  @override
  int date;

  ClientCollectionModel({@required this.accountNumber, @required this.amount, @required this.date});


}