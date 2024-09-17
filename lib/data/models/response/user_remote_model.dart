import 'dart:convert';

class UserResponseModel {
    final int? id;
    final String? name;
    final String? email;
    final dynamic emailVerifiedAt;
    final dynamic phone;
    final dynamic address;
    final dynamic country;
    final dynamic city;
    final dynamic province;
    final dynamic district;
    final dynamic postalCode;
    final String? roles;
    final dynamic image;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? isLivestreaming;

    UserResponseModel({
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

    factory UserResponseModel.fromJson(String str) => UserResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserResponseModel.fromMap(Map<String, dynamic> json) => UserResponseModel(
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
