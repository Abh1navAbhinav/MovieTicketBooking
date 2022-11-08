class EndPoints {
  static const String baseUrl = "https://abhi-turf-booking.herokuapp.com";
  static const String phoneLogin = "/account/loginwith-number";
  static const String verifyOtp = "/account/verify-number-otp";
  static const String loginEmail = "/account/login-email";
  static const String signupEmail = "/account/signup-email";
  static const String emailOtpVerify = "/account/verify-email-otp";
  static const String nearestTurf = '/user/nearest-turf/';
  static const String allTurf = '/user/all-turf';
  static const String addWishList = '/user/add-wishlist';
  static const String getWishList = '/user/get-wishlist/';
  static const String removeWishList = '/user/delete-wishlist/';
  static const String bookTurf = '/account/add-booking';
  static const String getBookedTurf = '/account/get-booking/';
}
