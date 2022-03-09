import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Utilities/app_pages.dart';
import '../Provider/change_password_provider.dart';




class ChangePasswordController extends GetxController{

  final localStorage = GetStorage();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changePassword(Map<String, dynamic> body) async {

    print("====================Change Password Api Call====================");
    try{
      isLoading.value = true;
      update();
      await ChangePasswordProvider().changePasswordRequest(body).then((value){
        if(value.isNotEmpty){
          localStorage.erase();
          Get.offAllNamed(Routes.LOGIN);
        }
      });

    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }


  }
}