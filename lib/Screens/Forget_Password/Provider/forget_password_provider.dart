import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:nr_japan/Models/ForgotPasswordResponseModel.dart';
import 'package:nr_japan/Utilities/api_constants.dart';
import 'package:http/http.dart' as http;




class ForgotPasswordProvider extends GetConnect {

  Future<ForgotPasswordResponseModel?> forgotPasswordRequest(Map<String, dynamic> body)async{
    var url = Uri.parse(APIConstants.forgotPassword);
    final response = await http.post(url, body: json.encode(body), headers: {
      "content-Type": "application/json"
    });

    log("${response.statusCode}");
    if(response.statusCode ==200){
      var jsonData = json.decode(response.body);
      return ForgotPasswordResponseModel.fromJson(jsonData);
    } else {
      return null ;
    }
  }
}