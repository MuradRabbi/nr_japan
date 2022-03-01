import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nr_japan/ApiServices/response_object.dart';
import 'package:nr_japan/Utilities/api_constants.dart';
import 'package:nr_japan/Utilities/app_pages.dart';
import 'package:nr_japan/Utilities/response_code.dart';
import 'package:nr_japan/Utilities/shared_perf_keys.dart';

import '../../../ApiServices/repository.dart';
import '../../../Models/common_Sync_Response_Model.dart';




class SplashScreenController extends GetxController {

  final localStorage = GetStorage();


  @override
  void onInit() async {

    super.onInit();

    await _fetchCommonSyncRequestData();

    String token = "";
    if(localStorage.read(LocalStorageKeys.apiToken) != null){
      token = localStorage.read(LocalStorageKeys.apiToken);
    }

    if( token != null && token.isNotEmpty){
      Future.delayed(Duration(seconds: 2), () {
         Get.offAndToNamed(Routes.DASHBOARD);
      });
    }
    else{
      Future.delayed(Duration(seconds: 2), () {
        Get.offAndToNamed(Routes.LOGIN);
      });
    }
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  _fetchCommonSyncRequestData() async{
    Map<String, dynamic> parameters = Map<String, dynamic>();
    parameters ["authentication"] = APIConstants.AUTHENTICATION;
    ResponseObject responseObject = await repository.commonSyncRequest(parameters);

    switch (responseObject.id){
      case ResponseCode.SUCCESSFUL :
        CommonSyncResponseModel commonSyncResponseModel = responseObject.object as CommonSyncResponseModel;
        localStorage.write(LocalStorageKeys.cdnUrl, commonSyncResponseModel.data!.cdnUrl);
        localStorage.write(LocalStorageKeys.forgotPasswordText, commonSyncResponseModel.data!.forgotPasswordText);
        break;
      case ResponseCode.FAILED :
        break;
      case ResponseCode.AUTHORIZATION_FAILED :
        break;
    }
  }

}
