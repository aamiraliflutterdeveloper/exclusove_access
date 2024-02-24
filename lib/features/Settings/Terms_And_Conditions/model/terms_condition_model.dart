// To parse this JSON data, do
//
//     final termsConditionModel = termsConditionModelFromJson(jsonString);

import 'dart:convert';

TermsConditionModel termsConditionModelFromJson(String str) => TermsConditionModel.fromJson(json.decode(str));

String termsConditionModelToJson(TermsConditionModel data) => json.encode(data.toJson());

class TermsConditionModel {
  TermsConditionModel({
    required this.message,
    required this.data,
    required this.success,
    required this.status,
  });

  String message;
  TermsCondition data;
  bool success;
  int status;

  factory TermsConditionModel.fromJson(Map<String, dynamic> json) => TermsConditionModel(
    message: json["message"],
    data: TermsCondition.fromJson(json["data"]),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
    "success": success,
    "status": status,
  };
}

class TermsCondition {
  TermsCondition({
    required this.id,
    required this.name,
    required this.slug,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });

  int id;
  String name;
  String slug;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  String type;

  factory TermsCondition.fromJson(Map<String, dynamic> json) => TermsCondition(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    content: json["content"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "content": content,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "type": type,
  };
}
