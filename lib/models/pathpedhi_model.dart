import 'package:collection_app/bloc/models/pathpedhi_model.dart';
import 'package:collection_app/network/network_config.dart';
import 'package:flutter/foundation.dart';

class PathpedhiModel implements PathpedhiModelContract{

  @override
  String address1;

  @override
  String address2;

  @override
  String address3;

  @override
  String name;

  @override
  String phone;

  @override
  int pin;

  PathpedhiModel({@required this.name, @required this.address1, @required this.address2, @required this.address3,
  @required this.pin, @required this.phone});

  @override
  Map<String, dynamic> toJson() => {
    NetworkConfig.API_KEY_PATHPEDHI_NAME : this.name,
    NetworkConfig.API_KEY_PATHPEDHI_ADDRESS1 : this.address1,
    NetworkConfig.API_KEY_PATHPEDHI_ADDRESS2 : this.address2,
    NetworkConfig.API_KEY_PATHPEDHI_ADDRESS3 : this.address3,
    NetworkConfig.API_KEY_PATHPEDHI_PIN : this.pin,
    NetworkConfig.API_KEY_PATHPEDHI_PHONE : this.phone,
  };

}