import 'package:collection_app/bloc/models/client_model.dart';
import 'package:flutter/foundation.dart';

class ClientModel implements ClientModelContract{
  @override
  String accountNumber;

  @override
  double balance;

  @override
  String name;

  ClientModel({@required this.accountNumber, @required this.balance, @required this.name});

}