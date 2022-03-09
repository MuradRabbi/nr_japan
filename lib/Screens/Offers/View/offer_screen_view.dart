import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nr_japan/Models/offer_response_model.dart';
import 'package:nr_japan/Screens/Offers/Controller/offer_controller.dart';



class OfferScreenView extends StatefulWidget {
  const OfferScreenView({Key? key}) : super(key: key);

  @override
  _OfferScreenViewState createState() => _OfferScreenViewState();
}

class _OfferScreenViewState extends State<OfferScreenView> {

  final OfferController controller = Get.put(OfferController());


  late Future <List<OfferResponseModel>> fetchOfferItemData;


  @override
  void initState(){
    super.initState();
    // fetchOfferItemData = offerRequest();
  }

  // Future<List<Map>> _fetchOfferItemData() async {
  //   List<Map> dataList = [];
  //
  //   Map item = new Map();
  //   item['id'] = 1;
  //   item['title'] = "MotorCycle";
  //
  //
  //
  //
  //   dataList.add(item);
  //
  //   item = new Map();
  //   item['id'] = 2;
  //   item['title'] = "Mobile Phone";
  //
  //
  //   dataList.add(item);
  //
  //   item = new Map();
  //   item['id'] = 3;
  //   item['title'] = "Home Appliance";
  //
  //
  //   dataList.add(item);
  //
  //   item = new Map();
  //   item['id'] = 4;
  //   item['title'] = "Grocery";
  //
  //
  //   dataList.add(item);
  //
  //   item = new Map();
  //   item['id'] = 5;
  //   item['title'] = "Medicine";
  //
  //   dataList.add(item);
  //
  //   item = new Map();
  //   item['id'] = 6;
  //   item['title'] = "Home Appliance";
  //
  //
  //   dataList.add(item);
  //
  //   item = new Map();
  //   item['id'] = 7;
  //   item['title'] = "Grocery";
  //
  //
  //   dataList.add(item);
  //
  //   item = new Map();
  //   item['id'] = 8;
  //   item['title'] = "Medicine";
  //
  //   dataList.add(item);
  //
  //   return dataList;
  // }

  Widget _emptyScreenPlaceholder() {
    return Container();
  }

  Widget allOfferItem() {


    return Container(
      // color: AppColors.BackgroundColor2,
      // padding: EdgeInsets.only(top:15),
      width: double.infinity,
      child: FutureBuilder<List<OfferResponseModel>>(
          future: fetchOfferItemData ,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return _emptyScreenPlaceholder();
            } else {
              return (snapshot.data.length > 0)
                  ? Container(
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return offerItem(snapshot.data[index], index);
                    },

                  ))
                  : _emptyScreenPlaceholder();
            }
          }),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoading.value == false
      ? Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: allOfferItem(),
      ) :  Center(
        child: CircularProgressIndicator(),
      )),
    );
  }


  Container offerItem(Map data , int index){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 25, right: 25, top: index == 0 ?10 : 5),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Text(data[index].title, style: TextStyle(color: Colors.white),),
    );
  }
}
