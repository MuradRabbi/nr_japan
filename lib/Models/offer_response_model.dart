
import 'dart:convert';

OfferResponseModel offerResponseModelFromJson(String str) => OfferResponseModel.fromJson(json.decode(str));

String offerResponseModelToJson(OfferResponseModel data) => json.encode(data.toJson());

class OfferResponseModel {
  OfferResponseModel({
    this.id,
    this.title,
    this.slug,
    this.status,
    this.adminId,
    this.createdAt,
    this.updatedAt,
    this.photo,
    this.forMember,
    this.sort,
    this.photoUrl,
  });

  int? id;
  String? title;
  String? slug;
  String? status;
  int? adminId;
  String? createdAt;
  String? updatedAt;
  dynamic photo;
  int? forMember;
  int? sort;
  String? photoUrl;

  factory OfferResponseModel.fromJson(Map<String, dynamic> json) => OfferResponseModel(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    status: json["status"],
    adminId: json["admin_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    photo: json["photo"],
    forMember: json["for_member"],
    sort: json["sort"],
    photoUrl: json["photoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "status": status,
    "admin_id": adminId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "photo": photo,
    "for_member": forMember,
    "sort": sort,
    "photoUrl": photoUrl,
  };
}
