import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:my_travaly_demo/controller/home_controller.dart';
import 'package:my_travaly_demo/screens/hotel_details_screen.dart';

searchListWid(HomeController _home, BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Obx(() => _home.searchValueMap.isNotEmpty
            ? ListView(
                children: List.generate(5, (index) {
                final data = _home.searchValueMap[_home.rawSearchKey[index]];
                final listOfResult = data['listOfResult'];

                return listOfResult != null && listOfResult.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(data['numberOfResult'], (ind) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (index == 0 && ind == 0)
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "Search Count : ${_home.totalSearchCount}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
                                      child: ListTile(
                                        title: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: listOfResult[ind]['valueToDisplay'] != null && listOfResult[ind]['address'] != null
                                                ? RichText(
                                                    text: TextSpan(style: TextStyle(color: Colors.black), children: [
                                                      TextSpan(
                                                        text: index >= 2 ? '' : "${listOfResult[ind]['valueToDisplay']} , ",
                                                      ),
                                                      TextSpan(
                                                        text: listOfResult[ind]['address']['city'] != null
                                                            ? "${listOfResult[ind]['address']['city']} , "
                                                            : "",
                                                      ),
                                                      TextSpan(
                                                        text: listOfResult[ind]['address']['state'] != null
                                                            ? '${listOfResult[ind]['address']['state']}  '
                                                            : '',
                                                      ),
                                                      TextSpan(
                                                        text: listOfResult[ind]['address']['country'] ?? '',
                                                      )
                                                    ]),
                                                  )
                                                : SizedBox.shrink()),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(_home.filterSearch[index]),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            // Get.to(HotelDetailsScreen());
                                          },
                                          icon: Icon(
                                            color: Colors.pink,
                                            Icons.arrow_circle_right_outlined,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })),
                      )
                    : SizedBox.shrink();
              }))
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              ));
      }).then((val) {
    _home.searchValueMap.clear();
  });
}
