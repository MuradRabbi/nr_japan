import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Utilities/app_pages.dart';
import 'Utilities/shared_perf_keys.dart';
import 'translations/locale_string.dart';

List<CameraDescription> cameras = [];

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  await GetStorage.init();

  final localStorage = GetStorage();
  bool isEnglish = true;
  if(localStorage.read(LocalStorageKeys.isEnglish)!=null){
    if(localStorage.read(LocalStorageKeys.isEnglish)){
      isEnglish = true;
    } else{
      isEnglish = false;
    }
  } else{
    isEnglish = false;
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: isEnglish ?  Locale('en','US') : Locale('fr', 'CA'),
      title: "Cubic Attendence",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}