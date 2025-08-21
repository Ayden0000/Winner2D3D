class Api {
  static const String baseUrl = "http://163.44.197.36:8080";
  static const String login = "$baseUrl/api/winner/v1/auth/login";
  static const String register = "$baseUrl/api/winner/v1/user/acc";
  static const String transfer = "$baseUrl/api/winner/v1/unit-transfer";
  static const String transferHistory = "$baseUrl/api/winner/v1/unit-transfer";
  static const String userList = "$baseUrl/api/winner/v1/user/parent";
  static const String betEnable = "$baseUrl/api/betting-disable";
  static const String betDisable = "$baseUrl/api/betting-disable";
  static const String winningResults = "$baseUrl/api/winner/v1/winning-results";
  static const String agentData = "$baseUrl/api/winner/v1/bets/results/user";
  static const String userWallet = "$baseUrl/api/winner/v1/user/wallet";
  static const String betRules = "$baseUrl/api/winner/v1/bet-rules";
  static const String bet = "$baseUrl/api/winner/v1/bets";
  static const String betHistory = "$baseUrl/api/winner/v1/bet-history";
  static const String rulesHistory = "$baseUrl/api/winner/v1/bet-rules/today";
  static const String ruleDetails = "$baseUrl/api/winner/v1/bet-rules/details";
  static const String getWinningResult =
      "$baseUrl/api/winner/v1/winning-results";
}
