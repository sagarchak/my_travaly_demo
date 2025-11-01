import 'package:json_annotation/json_annotation.dart';

part 'search_list_entity.g.dart';

@JsonSerializable()
class SearchListEntity {
  String? action;
  Map<String, dynamic>? getSearchResultListOfHotels;

  factory SearchListEntity.fromJson(Map<String, dynamic> json) => _$SearchListEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SearchListEntityToJson(this);
  SearchListEntity({this.action, this.getSearchResultListOfHotels});
}

@JsonSerializable()
class SearchCriteria {
  SearchCriteria({
    this.accommodation,
    this.adults,
    this.arrayOfExcludedsearchType,
    this.checkIn,
    this.checkOut,
    this.childern,
    this.currency,
    this.highPrice,
    this.limit,
    this.lowPrice,
    this.preloaderList,
    this.rid,
    this.rooms,
    this.searchQuery,
    this.searchType,
  });
  factory SearchCriteria.fromJson(Map<String, dynamic> json) => _$SearchCriteriaFromJson(json);
  Map<String, dynamic> toJson() => _$SearchCriteriaToJson(this);
  String? checkIn;
  String? checkOut;
  int? rooms;
  int? adults;
  int? childern;
  String? searchType;
  List? searchQuery;
  List? accommodation;
  List? arrayOfExcludedsearchType;
  String? highPrice;
  String? lowPrice;
  int? limit;
  String? currency;
  List? preloaderList;
  int? rid;
}
