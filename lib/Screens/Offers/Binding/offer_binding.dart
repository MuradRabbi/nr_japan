import 'package:get/get.dart';
import 'package:nr_japan/Screens/Offers/Controller/offer_controller.dart';

class OfferBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OfferController());
  }

}