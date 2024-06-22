class ApiConstants {
  // base url for api

  static const String baseUrl = "http://election.somee.com";

  // base url for candiDate sign up

  static const String candiDateSignUpUrl = "/api/Auth/register/candidate";

// base url for candiDate login
  static const String candiDateLoginUrl = "/api/Auth/login/candidate";
  // base url for voter sign up
  static const String voterSignUpUrl = "/api/Auth/register/voter";
  // base url for voter login
  static const String voterLoginUrl = "/api/Auth/login/voter";


  // vote home
  static const String politicalPartiesUrl = "/api/Subcategories/political-parties";
  static const String politicalIssueUrl = "/api/Subcategories/issue-based-groups";
  static const String allCandidatesUrl = "/api/Candidates";
}
