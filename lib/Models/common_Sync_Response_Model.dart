import 'dart:convert';


CommonSyncResponseModel commonSyncResponseModelFromJson(String str) => CommonSyncResponseModel.fromJson(json.decode(str));

String commonSyncResponseModelToJson(CommonSyncResponseModel data) => json.encode(data.toJson());



class CommonSyncResponseModel {
  CommonSyncResponseModel({
    this.error,
    this.message,
    this.data,
    this.time,
  });

  int? error;
  String? message;
  Data? data;
  int? time;

  factory CommonSyncResponseModel.fromJson(Map<String, dynamic> json) => CommonSyncResponseModel(
    error: json["error"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data?.toJson(),
    "time": time,
  };
}

class Data {
  Data({
    this.cdnUrl,
    this.checkInText,
    this.forgotPasswordText,
  });

  String? cdnUrl;
  String? checkInText;
  String? forgotPasswordText;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cdnUrl: json["cdn_url"],
    checkInText: json["check_in_text"],
    forgotPasswordText: json["forgot_password_text"],
  );

  Map<String, dynamic> toJson() => {
    "cdn_url": cdnUrl,
    "check_in_text": checkInText,
    "forgot_password_text": forgotPasswordText,
  };
}
