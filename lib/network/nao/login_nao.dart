import 'package:collection_app/models/repository_response.dart';
import 'package:collection_app/network/network_config.dart';
import 'package:collection_app/network/network_endpoints.dart';
import 'package:collection_app/utils/network_util.dart';
import 'package:meta/meta.dart';

/// Login Network Access Object Class -> Network Access Object class for handling network requests of Login process
class LoginNAO {

  /// STATIC Is Authentic User Method -> Future<UserModel>
  /// @param -> @required userName -> String
  ///        -> @required userPassword -> String
  /// @usage -> Makes a HTTP-POST request to REST api on server.
  static Future<RepositoryResponse> isAuthenticUser(
  {@required String userID, @required String userPassword}) =>
      NetworkUtil().post( // HTTP-POST request
          url: NetworkEndpoints.LOGIN_API, // REST api URL
          body: { // Request body
            NetworkConfig.API_KEY_USER_ID: userID,
            NetworkConfig.API_KEY_USER_PASSWORD: userPassword
          }).then((dynamic response) { // On response received
            return RepositoryResponse.fromJson(response);// Map json response to UserModel object
          });
}
