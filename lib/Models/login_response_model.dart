import 'dart:convert';
import 'package:nr_japan/Models/user_model.dart';
import 'attendence_model.dart';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.error,
    this.message,
    this.data,
    this.token,
  });

  int? error;
  String? message;
  Data? data;
  String? token;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    error: json["error"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data!.toJson(),
    "token": token,
  };
}

class Data {
  Data({
    this.users,
    this.attendances,
  });

  Users? users;
  Attendances? attendances;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    users: Users.fromJson(json["users"]),
    attendances: json["attendances"]!=null? Attendances.fromJson(json["attendances"]) : Attendances(),
  );

  Map<String, dynamic> toJson() => {
    "users": users!.toJson(),
    "attendances": attendances!.toJson(),
  };
}


