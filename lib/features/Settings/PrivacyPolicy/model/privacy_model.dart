import 'dart:convert';

Privacy privacyFromJson(String str) => Privacy.fromJson(json.decode(str));

String privacyToJson(Privacy data) => json.encode(data.toJson());

class Privacy {
  Privacy({
    required this.message,
    required this.data,
    required this.success,
    required this.status,
  });

  String message;
  PrivacyModel data;
  bool success;
  int status;

  factory Privacy.fromJson(Map<String, dynamic> json) => Privacy(
    message: json["message"],
    data: PrivacyModel.fromJson(json["data"]),
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

class PrivacyModel {
  PrivacyModel({
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

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
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
