import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    required this.userMail,
    required this.userPassword,
  });

  String userMail;
  String userPassword;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        userMail: json["user_mail"],
        userPassword: json["user_password"],
      );

  Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
      };
}
