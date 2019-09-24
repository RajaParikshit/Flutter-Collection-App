

abstract class AgentModelContract {
  String agentCode;
  String agentName;
  String agentPassword;
  String accountCode;

  Map<String, dynamic> toJson();
}