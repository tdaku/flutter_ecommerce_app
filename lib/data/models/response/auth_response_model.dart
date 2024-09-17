import 'dart:convert';

class AuthResponseModel {
    final String? status;
    final String? message;
    final Data? data;

    AuthResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
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
    final String? token;

    Data({
        this.user,
        this.token,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "token": token,
    };
}

class User {
    final int? id;
    final String? name;
    final String? email;
    final dynamic emailVerifiedAt;
    final String? phone;
    final String? address;
    final String? country;
    final String? city;
    final String? province;
    final dynamic district;
    final String? postalCode;
    final String? roles;
    final String? image;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? isLivestreaming;

    User({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.address,
        this.country,
        this.city,
        this.province,
        this.district,
        this.postalCode,
        this.roles,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.isLivestreaming,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        address: json["address"],
        country: json["country"],
        city: json["city"],
        province: json["province"],
        district: json["district"],
        postalCode: json["postal_code"],
        roles: json["roles"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        isLivestreaming: json["is_livestreaming"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "address": address,
        "country": country,
        "city": city,
        "province": province,
        "district": district,
        "postal_code": postalCode,
        "roles": roles,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_livestreaming": isLivestreaming,
    };
}
