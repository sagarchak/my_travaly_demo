// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelListEntity _$HotelListEntityFromJson(Map<String, dynamic> json) =>
    HotelListEntity(
      action: json['action'] as String?,
      popularStay: json['popularStay'] == null
          ? null
          : PopularStay.fromJson(json['popularStay'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelListEntityToJson(HotelListEntity instance) =>
    <String, dynamic>{
      'action': instance.action,
      'popularStay': instance.popularStay,
    };

PopularStay _$PopularStayFromJson(Map<String, dynamic> json) => PopularStay(
      limit: (json['limit'] as num?)?.toInt(),
      entityType: json['entityType'] as String?,
      filter: json['filter'] == null
          ? null
          : Filter.fromJson(json['filter'] as Map<String, dynamic>),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$PopularStayToJson(PopularStay instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'entityType': instance.entityType,
      'filter': instance.filter,
      'currency': instance.currency,
    };

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      searchType: json['searchType'] as String?,
      searchTypeInfo: json['searchTypeInfo'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'searchType': instance.searchType,
      'searchTypeInfo': instance.searchTypeInfo,
    };

SearchTypeInfo _$SearchTypeInfoFromJson(Map<String, dynamic> json) =>
    SearchTypeInfo(
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$SearchTypeInfoToJson(SearchTypeInfo instance) =>
    <String, dynamic>{
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
    };
