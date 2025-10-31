import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../widgets/main_ hotel_list_wid.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({super.key});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  ScrollController? _scrollController;
  final _homeController = HomeController.to;
  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);

    super.initState();
  }

  _scrollListener() {
    if (_scrollController!.position.pixels > _scrollController!.position.maxScrollExtent - 200 && !_homeController.isLoading.value) {
      _homeController;
      _homeController.isLoading.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.zero,
            height: Get.height * 0.35,
            width: double.maxFinite,
            decoration:
                BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75), bottomRight: Radius.circular(75))),
          ),
          SizedBox(
            height: 25,
          ),
          Obx(() => _homeController.hotelList.isNotEmpty
              ? Expanded(child: Scrollbar(controller: _scrollController, child: MainHotelList(_scrollController!, _homeController)))
              : CircularProgressIndicator(
                  color: Colors.pink,
                )),
          Obx(() => _homeController.isLoading.value
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircularProgressIndicator(
                    color: Colors.pink,
                  ),
                )
              : SizedBox.shrink())
        ],
      ),
    );
    ;
  }
}
