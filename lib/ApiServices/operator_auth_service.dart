import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:nr_japan/ApiServices/response_object.dart';
import 'package:dio/dio.dart';
import 'package:nr_japan/Models/common_Sync_Response_Model.dart';
import 'package:nr_japan/Utilities/api_constants.dart';
import 'package:nr_japan/Utilities/response_code.dart';
import 'package:nr_japan/Utilities/shared_perf_keys.dart';

import '../Models/user_model.dart';
import '../Utilities/utils.dart';



class OperatorAuthService{

  Future<ResponseObject> commonSyncRequest(Map<String , dynamic> parameters) async {

    log("==================CommonSync Api Call====================");
    final localStorage = GetStorage();
    Response response;
    Dio dio = Dio();
    dio.options.headers["Accept"] = "application/json";

    log("Common Sync token ${localStorage.read(LocalStorageKeys.apiToken)}");


    try{
      response = await dio.post(APIConstants.commonSync , queryParameters: parameters);
      log("================commonSync${response.data}==================");
      if(response.statusCode == 200){
        final error = response.data['error'];
        if(error == 0){
          CommonSyncResponseModel commonSyncResponseModel = CommonSyncResponseModel.fromJson(response.data);
          return ResponseObject(id: ResponseCode.SUCCESSFUL, object: commonSyncResponseModel);
        }else{
          Utils().showToast(response.data["massage"], true);
        }
      }
    } on DioError catch(e) {
       return ResponseObject(id: ResponseCode.FAILED, object: e);
    }

    return ResponseObject(id: ResponseCode.FAILED , object: response.data["massage"]);
  }

  Future<ResponseObject> profileDetailsRequest(Map<String, dynamic> parameters) async {
    print("==================== profile Api Call====================");
    final localStorage = GetStorage();
    Response response;
    Dio dio = Dio();
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Authorization"] = "Bearer ${localStorage.read(LocalStorageKeys.apiToken)}";

    log("profile token ${localStorage.read(LocalStorageKeys.apiToken)}");

    try {
      response =
      await dio.post(APIConstants.profile, queryParameters: parameters);

      if (response.statusCode == 200) {
        final error = response.data["error"];
        if (error == 0) {

          Users users =
          Users.fromJson(response.data["data"]["users"]);
          log("profile users $users");
          log("profile response.data ${response.data}");
          return ResponseObject(id: ResponseCode.SUCCESSFUL, object: users);
        } else {
          Utils().showToast(response.data["message"], true);
        }
      }
    } on DioError catch (e) {
      return ResponseObject(id: ResponseCode.FAILED, object: e);
    }

    return ResponseObject(id: ResponseCode.FAILED, object: response.data["message"]);
  }

  Future<ResponseObject> logoutRequest() async {
    print("==================== logout Api Call====================");
    final localStorage = GetStorage();
    Response response;
    Dio dio = new Dio();
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Authorization"] = "Bearer ${localStorage.read(LocalStorageKeys.apiToken)}";

    log("logout token ${localStorage.read(LocalStorageKeys.apiToken)}");

    try {
      response =
      await dio.post(APIConstants.logout);

      if (response.statusCode == 200) {
        final error = response.data["error"];
        if (error == 0) {
          Utils().showToast("${response.data["message"]}", false);
          return ResponseObject(id: ResponseCode.SUCCESSFUL, object: response.data["message"]);
        } else {
          Utils().showToast(response.data["message"], true);
        }
      } else {
        Utils().showToast("Offer Accept Failed", true);
      }
    } on DioError catch (e) {
      return ResponseObject(id: ResponseCode.FAILED, object: e);
    }

    return ResponseObject(id: ResponseCode.FAILED, object: response.data["message"]);
  }
}


