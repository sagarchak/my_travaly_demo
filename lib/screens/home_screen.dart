import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import 'package:my_travaly_demo/controller/home_controller.dart';
import 'package:my_travaly_demo/widgets/main_%20hotel_list_wid.dart';
import 'package:my_travaly_demo/widgets/search_list_wid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController? _scrollController;
  final _homeController = HomeController.to;
  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    HomeController.to.registerDevice();
    super.initState();
  }

  _scrollListener() {
    if (_scrollController!.position.pixels > _scrollController!.position.maxScrollExtent - 200 && !_homeController.isLoading.value) {
      if (_homeController.searchValueMap.isEmpty) {
        _homeController.hotels();
        _homeController.isLoading.value = true;
      }
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
            child: SizedBox(
              width: Get.width * 0.75,
              child: TextField(
                onSubmitted: (input) {
                  if (input.isNotEmpty) {
                    _homeController.searchValue(input);
                    _homeController.searchValueMap.clear();
                    searchListWid(_homeController, context);
                  }
                },
                controller: _homeController.inputController,
                decoration: InputDecoration(
                    hintText: "hotel name, city, state, or country",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_homeController.inputController.text.isNotEmpty) {
                          _homeController.searchValueMap.clear();
                          _homeController.searchValue(_homeController.inputController.text);
                          searchListWid(_homeController, context);
                        }
                      },
                      icon: Icon(Icons.search),
                      color: Colors.pink,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Obx(() => _homeController.hotelList.isNotEmpty
              ? Expanded(
                  child: Scrollbar(
                      controller: _scrollController, child: MainHotelList(scrollController: _scrollController, list: _homeController.hotelList)))
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
  }
}
