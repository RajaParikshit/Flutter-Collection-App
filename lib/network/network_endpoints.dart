class NetworkEndpoints {

  static const String _BASE_URL = "http://192.168.0.104/collection_app";
  static const String _BASE_API = _BASE_URL + "/v1";

  static const String LOGIN_API = _BASE_API +  "/user/login";

  static const String ADD_PATHPEDHI_API = _BASE_API + "/pathpedhi/add";

  static const String ADD_AGENT_API = _BASE_API + "/agent/add";
  static const String GET_COLLECTION_FOR_AGENT = _BASE_API + "/agent/get_collection";

}
