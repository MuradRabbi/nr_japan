


class Attendances {
  Attendances({
    this.id,
    this.actionId,
    this.userId,
    this.checkDate,
    this.checkInTime,
    this.checkOutTime,
    this.checkInAt,
    this.checkOutAt,
    this.picture,
    this.userIp,
    this.userAgent,
    this.latitude,
    this.longitude,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.late,
  });

  int? id;
  int? actionId;
  int? userId;
  String? checkDate;
  String? checkInTime;
  dynamic checkOutTime;
  String? checkInAt;
  dynamic checkOutAt;
  String? picture;
  String? userIp;
  String? userAgent;
  String? latitude;
  String? longitude;
  dynamic note;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic late;

  factory Attendances.fromJson(Map<String, dynamic> json) => Attendances(
    id: json["id"],
    actionId: json["action_id"],
    userId: json["user_id"],
    checkDate: json["check_date"],
    checkInTime: json["check_in_time"],
    checkOutTime: json["check_out_time"],
    checkInAt: json["check_in_at"],
    checkOutAt: json["check_out_at"],
    picture: json["picture"],
    userIp: json["user_ip"],
    userAgent: json["user_agent"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    note: json["note"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    late: json["late"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "action_id": actionId,
    "user_id": userId,
    "check_date": checkDate,
    "check_in_time": checkInTime,
    "check_out_time": checkOutTime,
    "check_in_at": checkInAt,
    "check_out_at": checkOutAt,
    "picture": picture,
    "user_ip": userIp,
    "user_agent": userAgent,
    "latitude": latitude,
    "longitude": longitude,
    "note": note,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "late": late,
  };
}