import 'dart:convert';

ApiException apiExceptionFromJson(String str) => ApiException.fromJson(json.decode(str));

String apiExceptionToJson(ApiException data) => json.encode(data.toJson());

class ApiException {
  ApiException({
    required this.message,
    required this.errors,
    required this.success,
    required this.status,
  });

  String message;
  List<String> errors;
  bool success;
  int status;

  factory ApiException.fromJson(Map<String, dynamic> json) => ApiException(
    message: json["message"],
    errors: List<String>.from(json["errors"].map((x) => x)),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "success": success,
    "status": status,
  };
}
