class UserModel {
  UserModel({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.id,
    required this.email,
    required this.name,
    this.mobile,
    required this.address,
    required this.age,
    required this.lat,
    required this.lng,
    this.socialToken,
    this.userType,
    required this.status,
    this.rememberToken,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.stripeId,
    this.cardBrand,
    this.cardLastFour,
    this.trialEndsAt,
    required this.deviceToken,
    required this.isVerified,
    required this.isApproved,
    this.gender,
  });

  int id;
  String email;
  String name;
  dynamic mobile;
  String address;
  String age;
  String lat;
  String lng;
  dynamic socialToken;
  dynamic userType;
  bool status;
  dynamic rememberToken;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic stripeId;
  dynamic cardBrand;
  dynamic cardLastFour;
  dynamic trialEndsAt;
  String deviceToken;
  bool isVerified;
  String isApproved;
  dynamic gender;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    mobile: json["mobile"],
    address: json["address"],
    age: json["age"],
    lat: json["lat"],
    lng: json["lng"],
    socialToken: json["social_token"],
    userType: json["user_type"],
    status: json["status"],
    rememberToken: json["remember_token"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    stripeId: json["stripe_id"],
    cardBrand: json["card_brand"],
    cardLastFour: json["card_last_four"],
    trialEndsAt: json["trial_ends_at"],
    deviceToken: json["device_token"],
    isVerified: json["is_verified"],
    isApproved: json["is_approved"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "mobile": mobile,
    "address": address,
    "age": age,
    "lat": lat,
    "lng": lng,
    "social_token": socialToken,
    "user_type": userType,
    "status": status,
    "remember_token": rememberToken,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "stripe_id": stripeId,
    "card_brand": cardBrand,
    "card_last_four": cardLastFour,
    "trial_ends_at": trialEndsAt,
    "device_token": deviceToken,
    "is_verified": isVerified,
    "is_approved": isApproved,
    "gender": gender,
  };
}
