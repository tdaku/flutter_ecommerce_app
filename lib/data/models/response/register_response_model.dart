import 'dart:convert';

class RegisterResponseModel {
    final String? status;
    final String? message;
    final Data? data;

    RegisterResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory RegisterResponseModel.fromJson(String str) => RegisterResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterResponseModel.fromMap(Map<String, dynamic> json) => RegisterResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
    };
}

class Data {
    final User? user;

    Data({
        this.user,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
    };
}

class User {
    final String? name;
    final String? email;
    final String? phone;
    final String? address;
    final String? country;
    final String? city;
    final String? roles;
    final String? postalCode;
    final String? image;
    final DateTime? updatedAt;
    final DateTime? createdAt;
    final int? id;

    User({
        this.name,
        this.email,
        this.phone,
        this.address,
        this.country,
        this.city,
        this.roles,
        this.postalCode,
        this.image,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        country: json["country"],
        city: json["city"],
        roles: json["roles"],
        postalCode: json["postal_code"],
        image: json["image"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "country": country,
        "city": city,
        "roles": roles,
        "postal_code": postalCode,
        "image": image,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
