import 'dart:convert';

UpcomingEventsModel upcomingEventsModelFromJson(String str) => UpcomingEventsModel.fromJson(json.decode(str));

String upcomingEventsModelToJson(UpcomingEventsModel data) => json.encode(data.toJson());

class UpcomingEventsModel {
  UpcomingEventsModel({
    required this.message,
    required this.data,
    required this.success,
    required this.status,
  });

  String message;
  List<UpcomingEvents> data;
  bool success;
  int status;

  factory UpcomingEventsModel.fromJson(Map<String, dynamic> json) => UpcomingEventsModel(
    message: json["message"],
    data: List<UpcomingEvents>.from(json["data"].map((x) => UpcomingEvents.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class UpcomingEvents {
  UpcomingEvents({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.image,
    required this.lat,
    required this.lng,
    required this.address,
    required this.price,
    required this.description,
    required this.noOfBooking,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.longTimestamp,
  });

  int id;
  String name;
  String dateTime;
  String image;
  String lat;
  String lng;
  String address;
  String price;
  String description;
  String noOfBooking;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String longTimestamp;

  factory UpcomingEvents.fromJson(Map<String, dynamic> json) => UpcomingEvents(
    id: json["id"],
    name: json["name"],
    dateTime: json["date_time"],
    image: json["image"],
    lat: json["lat"],
    lng: json["lng"],
    address: json["address"],
    price: json["price"],
    description: json["description"],
    noOfBooking: json["no_of_booking"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    longTimestamp: json["long_timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "date_time": dateTime,
    "image": image,
    "lat": lat,
    "lng": lng,
    "address": address,
    "price": price,
    "description": description,
    "no_of_booking": noOfBooking,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "long_timestamp": longTimestamp,
  };
}
