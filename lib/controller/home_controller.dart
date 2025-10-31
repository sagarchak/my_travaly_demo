import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:my_travaly_demo/entity/hotel_list_entity.dart';
import 'package:my_travaly_demo/entity/register_device_entity.dart';
import 'package:my_travaly_demo/entity/search_auto_entity.dart';
import 'package:my_travaly_demo/entity/search_list_entity.dart';
import 'package:my_travaly_demo/utils/utils_general.dart';

import '../api/common_http_client.dart';
import '../constant/general_const.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  TextEditingController inputController = TextEditingController();

  String visitorToken = '';
  int totalSearchCount = 0;
  List rawSearchKey = [byPropertyName, byStreet, byCity, byState, byCountry];

  List filterSearch = [
    'By Property Wise',
    'By Street Wise',
    'By City Wise',
    'By State Wise',
    'By Country Wise',
  ];

  RxList hotelList = <dynamic>[].obs;
  RxList searchValueDetails = <dynamic>[].obs;
  RxBool isLoading = false.obs;
  RxMap searchValueMap = <String, dynamic>{}.obs;

  void searchDetails() {
    CommonHttpsClient(baseUrl,
        visitor_token: visitorToken,
        body: SearchListEntity(
                action: searchDetailsAction,
                getSearchResultListOfHotels: SearchCriteria(
                    accomodation: ['all'],
                    adults: 2,
                    checkIn: "2026-07-11",
                    checkOut: "2026-07-12",
                    rooms: 2,
                    childern: 0,
                    searchType: hotelIdSearch,
                    searchQuery: []).toJson())
            .toJson());
  }

  void searchValue(String _input) {
    CommonHttpsClient(baseUrl,
            visitor_token: visitorToken,
            body: SearchAutoEntity(
                    action: autoSearchAction,
                    searchAutoComplete: SearchAutoComplete(inputText: _input, limit: limit, searchType: [byCity, byState, byRandom, byPropertyName]))
                .toJson())
        .getResponse()
        .then((response) {
      if (response != null && response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body)['data'];
        putSearchList(data);
        snackbarMessage(title: "Search List", message: jsonDecode(response.body)['message']);
      } else {
        snackbarMessage(title: "Search List", message: jsonDecode(response!.body)['message']);
      }
    }).catchError((error) {
      snackbarMessage(title: "Search List", message: "Failed to fetch Search list");
    });
  }

  putSearchList(data) {
    searchValueMap.value = data['autoCompleteList'];
    totalSearchCount = data['totalNumberOfResult'];
  }

  putHotelData(List data) {
    data
        .map(
          (e) => hotelList.add(e),
        )
        .toList();
    isLoading.value = false;
  }

  void hotels() {
    CommonHttpsClient(baseUrl,
            visitor_token: visitorToken,
            body: HotelListEntity(
              action: hotelAction,
              popularStay: PopularStay(
                limit: limit,
                entityType: entityType,
                filter: Filter(
                    searchType: searchType,
                    searchTypeInfo: SearchTypeInfo(
                      country: country,
                      state: state,
                      city: city,
                    ).toJson()),
                currency: currency,
              ),
            ).toJson())
        .getResponse()
        .then((response) {
      if (response != null && response.statusCode == 200) {
        List data = jsonDecode(response.body)['data'];
        //hotelList.clear();
        putHotelData(data);
        snackbarMessage(title: "Hotel List", message: jsonDecode(response.body)['message']);
      } else {
        snackbarMessage(title: "Hotel List", message: jsonDecode(response!.body)['message']);
      }
    }).catchError((error) {
      snackbarMessage(title: "Hotel List", message: "Failed to fetch hotel list");
    });
  }

  void registerDevice() {
    try {
      CommonHttpsClient(
        baseUrl,
        body: RegisterDeviceEntity(
          action: deviceRegisterAction,
          deviceRegister: DeviceRegister(
            deviceModel: rMX3521,
            deviceFingerprint: deviceFingerprint,
            deviceBrand: deviceBrand,
            deviceId: deviceId,
            deviceName: deviceName,
            deviceManufacturer: deviceManufacturer,
            deviceProduct: deviceProduct,
            deviceSerialNumber: deviceSerialNumber,
          ),
        ).toJson(),
      ).getResponse().then((response) {
        if (response != null && response.statusCode == 201) {
          visitorToken = jsonDecode(response.body)['data']['visitorToken'];

          hotels();
          snackbarMessage(title: "Device Registration", message: jsonDecode(response.body)['message']);
        } else {
          snackbarMessage(title: "Device Registration", message: jsonDecode(response!.body)['message']);
        }
      }).catchError((error) {
        snackbarMessage(title: "Device Registration", message: "Registration Failed");
      });
    } catch (e) {}
  }
}
