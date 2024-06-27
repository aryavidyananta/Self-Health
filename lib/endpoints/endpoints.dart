class Endpoints {
  static const String baseURL = "http://127.0.0.1:5000/api/v1";

  static const String baseURLLive = "https://simobile.singapoly.com";

  static const String news = "$baseURL/news";

  static const String datas = "$baseURLLive/api/datas";
  // ignore: constant_identifier_names
  static const String CustomerService =
      "$baseURLLive/api/trpl/customer-service/2215091052";
  static const String balance = "$baseURLLive/api/balance/2215091079";
  static const String spending = "$baseURLLive/api/spending/2215091079";
  static const String login = "$baseURLLive/api/auth/login";
  static const String logout = "$baseURLLive/api/auth/logout";

  // ignore: prefer_typing_uninitialized_variables
  static var urlDatas;
}
