import 'dart:convert';

import 'package:get/get.dart';
import 'package:nr_japan/Models/offer_response_model.dart';
import 'package:nr_japan/Utilities/api_constants.dart';
import 'package:http/http.dart' as http;



class OfferProvider extends GetConnect{

  // Future<OfferResponseModel?> offerListRequest()async{
  //   var url = Uri.parse(APIConstants.offer);
  //
  //   final response = await http.post(url,
  //       headers:{
  //     "Content-Type" : "application/json"
  //       });
  //
  //   var jsonData = json.decode(response.body);
  //   if(response.statusCode == 200){
  //     return OfferResponseModel.fromJson(jsonData);
  //   }
  //   else{
  //     return null;
  //   }
  //
  // }


  Future<List<OfferResponseModel>?> offerListRequest()async{
    var Url = Uri.parse(APIConstants.offer);
    final response = await http.post(Url);

    if(response.statusCode == 200){
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => OfferResponseModel.fromJson(e)).toList();
    }else {
      return null;
    }
  }
  
}