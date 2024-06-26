// To parse this JSON data, do
//
//     final initResponse = initResponseFromJson(jsonString);

import 'dart:convert';

InitResponse initResponseFromJson(String str) => InitResponse.fromJson(json.decode(str));

String initResponseToJson(InitResponse data) => json.encode(data.toJson());

class InitResponse {
  String? success;
  String? message;
  InitData? data;

  InitResponse({
    this.success,
    this.message,
    this.data,
  });


  factory InitResponse.fromJson(Map<String, dynamic> json) => InitResponse(
    success: json["success"],
    message: json["message"],
    data: InitData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class InitData {
  List<Category> categories;
  List<Banners> banners;
  List<Post> posts;

  InitData({
    required this.categories,
    required this.banners,
    required this.posts,
  });

  factory InitData.fromJson(Map<String, dynamic> json) => InitData(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    banners: List<Banners>.from(json["banners"].map((x) => Banners.fromJson(x))),
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
  };
}

class Banners {
  int id;
  String name;
  String description;
  String path;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Banners({
    required this.id,
    required this.name,
    required this.description,
    required this.path,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    path: json["path"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "path": path,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Category {
  int id;
  String name;
  String description;
  String image;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Post {
  int id;
  String animalType;
  String gender;
  String image;
  String description;
  int userId;
  String seller;
  String title;
  String location;
  String phone;
  DateTime publishedOn;
  int currentMilk;
  int highestMilk;
  int price;
  int age;
  int animalTypeId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Post({
    required this.id,
    required this.animalType,
    required this.gender,
    required this.image,
    required this.description,
    required this.userId,
    required this.seller,
    required this.phone,
    required this.title,
    required this.location,
    required this.publishedOn,
    required this.currentMilk,
    required this.highestMilk,
    required this.price,
    required this.age,
    required this.animalTypeId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    animalType: json["animalType"],
    gender: json["gender"],
    image: json["image"],
    description: json["description"],
    userId: json["user_id"],
    seller: json["seller"],
    phone: json["phone"],
    title: json["title"],
    location: json["location"],
    publishedOn: DateTime.parse(json["publishedOn"]),
    currentMilk: json["currentMilk"],
    highestMilk: json["highestMilk"],
    price: json["price"],
    age: json["age"],
    animalTypeId: json["animalType_id"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "animalType": animalType,
    "gender": gender,
    "image": image,
    "description": description,
    "user_id": userId,
    "seller": seller,
    "phone": phone,
    "title": title,
    "location": location,
    "publishedOn": publishedOn.toIso8601String(),
    "currentMilk": currentMilk,
    "highestMilk": highestMilk,
    "price": price,
    "age": age,
    "animalType_id": animalTypeId,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
