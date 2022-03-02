import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/connect.dart';
import 'package:nr_japan/Models/login_response_model.dart';
import 'package:nr_japan/Utilities/api_constants.dart';
import 'package:http/http.dart' as http;


class LoginProvider extends GetConnect {

  Future <LoginResponseModel?> phoneLogin(Map<String, dynamic> body) async{
    var url = Uri.parse(APIConstants.login);


    final response = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"} );

    log("$response.statusCode");
    var jsonData = json.decode(response.body);
    if(response.statusCode == 200){
      return LoginResponseModel.fromJson(jsonData);
    } else{
      return null;
    }
  }


  }



