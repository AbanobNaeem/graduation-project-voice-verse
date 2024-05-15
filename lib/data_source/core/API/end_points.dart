class EndPoint {
  static const  String _baseUrl = "https://voice-verse-livid.vercel.app/";
  static String login = "${_baseUrl}auth/login";
  static String register = "${_baseUrl}auth/register";
  static String logOut  = "${_baseUrl}auth/logout" ;
  static String deleteAccount = "${_baseUrl}auth/account/delete" ;
  static String sendCode ="${_baseUrl}auth/forgetCode/send";
  static String resetPassword ="${_baseUrl}auth/resetPassword" ;
  static String changePassword  = "${_baseUrl}auth/changePassword" ;
  static String getUserData = "${_baseUrl}auth/profile";
  static String checkCode = "${_baseUrl}auth/forgetCode/set";
  static String changeName = "${_baseUrl}auth/username/edit";
  static String changeUserImage = "${_baseUrl}auth/profile/picture";
  static String getVideos = "${_baseUrl}video/all";
  static String addToFavorites = "${_baseUrl}video/favorites/add/";
  static String removeFromFavorites = "${_baseUrl}video/favorites/delete/";
  static String getFavoriteList = "${_baseUrl}video/favorites/" ;
  static String uploadVideo = "${_baseUrl}video/new" ;
  static String getUploadedVideos = "${_baseUrl}video/user";
}

class ApiKey {
  static String token = "token";
  static String message = "message";
  static String errorMessage = "message";
}