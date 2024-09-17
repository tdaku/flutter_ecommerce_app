import 'dart:convert';

class ProductsResponseModel {
    final String? status;
    final String? message;
    final List<Products>? data;

    ProductsResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory ProductsResponseModel.fromJson(String str) => ProductsResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductsResponseModel.fromMap(Map<String, dynamic> json) => ProductsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Products>.from(json["data"]!.map((x) => Products.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Products {
    final int? id;
    final int? sellerId;
    final int? categoryId;
    final String? name;
    final String? description;
    final String? price;
    final int? stock;
    final String? image;
    final int? active;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Seller? seller;

    Products({
        this.id,
        this.sellerId,
        this.categoryId,
        this.name,
        this.description,
        this.price,
        this.stock,
        this.image,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.seller,
    });

    factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Products.fromMap(Map<String, dynamic> json) => Products(
        id: json["id"],
        sellerId: json["seller_id"],
        categoryId: json["category_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        image: json["image"],
        active: json["active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        seller: json["seller"] == null ? null : Seller.fromMap(json["seller"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "seller_id": sellerId,
        "category_id": categoryId,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "image": image,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "seller": seller?.toMap(),
    };
}

class Seller {
    final int? id;
    final String? name;
    final String? email;
    final dynamic emailVerifiedAt;
    final String? phone;
    final String? address;
    final String? country;
    final String? city;
    final dynamic province;
    final dynamic district;
    final String? postalCode;
    final String? roles;
    final String? image;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? isLivestreaming;

    Seller({
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

    factory Seller.fromJson(String str) => Seller.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Seller.fromMap(Map<String, dynamic> json) => Seller(
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
