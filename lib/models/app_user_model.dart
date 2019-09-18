import 'package:collection_app/bloc/models/app_user_model.dart';
import 'package:flutter/foundation.dart';

class AppUserModel implements AppUserModelContract{
  @override
  bool isSuperUser;

  @override
  String userCode;

  @override
  String userPassword;

  AppUserModel({@required this.isSuperUser, @required this.userCode, @required this.userPassword});

}

