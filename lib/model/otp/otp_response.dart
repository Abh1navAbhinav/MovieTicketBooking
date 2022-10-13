class EmailVerifyRespones {
  EmailVerifyRespones({
    this.status,
    this.message,
    this.token,
    this.error,
    this.refreshToken,
  });
  bool? error;
  bool? status;
  String? message;
  String? token;
  String? refreshToken;

  factory EmailVerifyRespones.fromJson(Map<String, dynamic> json) =>
      EmailVerifyRespones(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        error: json["error"] ?? true,
        refreshToken: json["refreshToken"],
      );
}
