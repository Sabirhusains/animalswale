// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  String? success;
  String? message;
  UserData? userData;

  OtpModel({
    this.success,
    this.message,
    this.userData,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    success: json["success"],
    message: json["message"],
    userData: json["data"] == null ? null : UserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": userData?.toJson(),
  };
}

class UserData {
  int? id;
  String? name;
  String? nameEn;
  String? email;
  String? phone;
  String? profileImage;
  String? locationName;
  String? locationLat;
  String? locationLag;
  String? district;
  String? description;
  String? slug;
  String? slugId;
  String? referralCode;
  String? referralLink;
  Token? token;
  int? tblRolesId;
  int? verified;
  String? emailToken;
  String? deviceToken;
  String? platformType;
  String? device;
  int? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserData({
    this.id,
    this.name,
    this.nameEn,
    this.email,
    this.phone,
    this.profileImage,
    this.locationName,
    this.locationLat,
    this.locationLag,
    this.district,
    this.description,
    this.slug,
    this.slugId,
    this.referralCode,
    this.referralLink,
    this.token,
    this.tblRolesId,
    this.verified,
    this.emailToken,
    this.deviceToken,
    this.platformType,
    this.device,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    name: json["name"],
    nameEn: json["nameEn"],
    email: json["email"],
    phone: json["phone"],
    profileImage: json["profile_image"],
    locationName: json["location_name"],
    locationLat: json["location_lat"],
    locationLag: json["location_lag"],
    district: json["district"],
    description: json["description"],
    slug: json["slug"],
    slugId: json["slug_id"],
    referralCode: json["referral_code"],
    referralLink: json["referral_link"],
    token: json["token"] == null ? null : Token.fromJson(json["token"]),
    tblRolesId: json["tbl_roles_id"],
    verified: json["verified"],
    emailToken: json["email_token"],
    deviceToken: json["device_token"],
    platformType: json["platform_type"],
    device: json["device"],
    status: json["status"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "nameEn": nameEn,
    "email": email,
    "phone": phone,
    "profile_image": profileImage,
    "location_name": locationName,
    "location_lat": locationLat,
    "location_lag": locationLag,
    "district": district,
    "description": description,
    "slug": slug,
    "slug_id": slugId,
    "referral_code": referralCode,
    "referral_link": referralLink,
    "token": token?.toJson(),
    "tbl_roles_id": tblRolesId,
    "verified": verified,
    "email_token": emailToken,
    "device_token": deviceToken,
    "platform_type": platformType,
    "device": device,
    "status": status,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Token {
  Headers? headers;
  Original? original;
  dynamic exception;

  Token({
    this.headers,
    this.original,
    this.exception,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    headers: json["headers"] == null ? null : Headers.fromJson(json["headers"]),
    original: json["original"] == null ? null : Original.fromJson(json["original"]),
    exception: json["exception"],
  );

  Map<String, dynamic> toJson() => {
    "headers": headers?.toJson(),
    "original": original?.toJson(),
    "exception": exception,
  };
}

class Headers {
  Headers();

  factory Headers.fromJson(Map<String, dynamic> json) => Headers(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Original {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Original({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory Original.fromJson(Map<String, dynamic> json) => Original(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}
