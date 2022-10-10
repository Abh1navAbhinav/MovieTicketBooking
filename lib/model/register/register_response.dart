import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.status,
    required this.id,
  });

  bool status;
  String id;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        status: json["status"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "id": id,
      };
}
