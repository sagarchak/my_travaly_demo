import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';

Widget MainHotelList({ScrollController? scrollController, List? list}) {
  return ListView.builder(
    controller: scrollController,
    physics: BouncingScrollPhysics(),
    itemCount: list?.length,
    itemBuilder: (context, index) {
      final hotel = list?[index];
      final Map<String, dynamic> markedprice = hotel['markedPrice'];
      final Map<String, dynamic> googleReviewData = hotel['googleReview']?["data"] ?? {};

      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                          scrollController == null ? hotel['propertyImage']['fullUrl'] : hotel['propertyImage'], // url must be first positional arg
                          width: 180,
                          height: 150,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => SizedBox(
                                width: 180,
                                height: 150,
                                child: Icon(
                                  color: Colors.red,
                                  Icons.error,
                                  size: 35,
                                ),
                              )),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.35,
                        child: Text(
                          textAlign: TextAlign.start,
                          hotel['propertyName'] ?? 'N/A',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        hotel['propertyType'] ?? 'N/A',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${hotel['propertyStar'] ?? 'N/A'} Star ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      if (markedprice.isNotEmpty)
                        Container(
                            padding: EdgeInsets.all(10),
                            height: 35,
                            width: 55,
                            decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(10)),
                            child: RichText(
                              text: TextSpan(style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold), children: [
                                TextSpan(text: markedprice['currencySymbol'] ?? '₹'),
                                TextSpan(text: (markedprice['amount'] ?? '000').toString()),
                              ]),
                            )),
                    ],
                  ),
                ),
              ],
            ),
            if (googleReviewData.isNotEmpty) ...[
              SizedBox(height: 20),
              StarRating(
                rating: googleReviewData['overallRating']?.toDouble() ?? 0.0,
              ),
            ],
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
          ],
        ),
      );
    },
  );
}
