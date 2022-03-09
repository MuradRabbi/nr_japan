import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nr_japan/Utilities/shared_perf_keys.dart';
import 'package:http/http.dart' as http;
import '../../../Utilities/api_constants.dart';





class ChangePasswordProvider extends GetConnect{

  Future<String> changePasswordRequest(Map<String , dynamic> body) async{
    final localStorage = GetStorage();
    String token = localStorage.read(LocalStorageKeys.apiToken);
    var url = Uri.parse(APIConstants.changePassword);
    final response = await http.post(url, body: json.encode(body),
    headers: {
      "Authentication" : "Bearer $token",
      "Content-Type" : "Application/json"
    });
    log("${response.statusCode}");
    var jsonData = json.decode(response.body);
    if(response.statusCode == 200){
      return jsonData["massage"];
    } else {
      return "";
    }
  }

}