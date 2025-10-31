import 'package:json_annotation/json_annotation.dart';
part 'hotel_list_entity.g.dart';

@JsonSerializable()
class HotelListEntity {
  String? action = 'popularStay';
  PopularStay? popularStay;

  HotelListEntity({this.action, this.popularStay});

  factory HotelListEntity.fromJson(Map<String, dynamic> json) => _$HotelListEntityFromJson(json);
  Map<String, dynamic> toJson() => _$HotelListEntityToJson(this);
}

@JsonSerializable()
class PopularStay {
  int? limit;
  String? entityType;
  Filter? filter;
  String? currency;
  factory PopularStay.fromJson(Map<String, dynamic> json) => _$PopularStayFromJson(json);
  Map<String, dynamic> toJson() => _$PopularStayToJson(this);
  PopularStay({this.limit, this.entityType, this.filter, this.currency});
}

@JsonSerializable()
class Filter {
  String? searchType;
  Map<String, dynamic>? searchTypeInfo;
  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
  Map<String, dynamic> toJson() => _$FilterToJson(this);
  Filter({this.searchType, this.searchTypeInfo});
}

@JsonSerializable()
class SearchTypeInfo {
  String? country;
  String? state;
  String? city;
  factory SearchTypeInfo.fromJson(Map<String, dynamic> json) => _$SearchTypeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SearchTypeInfoToJson(this);
  SearchTypeInfo({this.country, this.state, this.city});
}
