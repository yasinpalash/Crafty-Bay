class Urls {
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/api';
  static String sentEmailOtp(String email) => '$_baseUrl/UserLogin/$email';
  static String verityOTP(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String readProfile= '$_baseUrl/ReadProfile';
  static String createProfile= '$_baseUrl/CreateProfile';
}
