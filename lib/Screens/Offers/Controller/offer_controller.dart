import 'dart:developer';

import 'package:get/get.dart';
import 'package:nr_japan/Models/offer_response_model.dart';
import 'package:nr_japan/Screens/Offers/Provider/offer_provider.dart';



class OfferController extends GetxController{

  var isLoading = false.obs;
  var offerResponseModel = OfferResponseModel().obs;

  @override
  void onInit()async {
    super.onInit();
   await offerRequest();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  offerRequest() async{
    log("====================== Offer Api Call ===================");
    try{

      isLoading.value == true;
      update();
      await OfferProvider().offerListRequest().then((value){
         if (value != null){
           offerResponseModel.value = value as OfferResponseModel;
           update();
         }
      });


    }catch(e){
      print(e);
    } finally{
      isLoading.value = false;
      update();
    }
  }


}