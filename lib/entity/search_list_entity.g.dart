// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchListEntity _$SearchListEntityFromJson(Map<String, dynamic> json) => SearchListEntity(
      action: json['action'] as String?,
      getSearchResultListOfHotels: json['getSearchResultListOfHotels'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SearchListEntityToJson(SearchListEntity instance) => <String, dynamic>{
      'action': instance.action,
      'getSearchResultListOfHotels': instance.getSearchResultListOfHotels,
    };

SearchCriteria _$SearchCriteriaFromJson(Map<String, dynamic> json) => SearchCriteria(
      accommodation: json['accommodation'] as List<dynamic>?,
      adults: (json['adults'] as num?)?.toInt(),
      arrayOfExcludedsearchType: json['arrayOfExcludedsearchType'] as List<dynamic>?,
      checkIn: json['checkIn'] as String?,
      checkOut: json['checkOut'] as String?,
      childern: (json['childern'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      highPrice: json['highPrice'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      lowPrice: json['lowPrice'] as String?,
      preloaderList: json['preloaderList'] as List<dynamic>?,
      rid: (json['rid'] as num?)?.toInt(),
      rooms: (json['rooms'] as num?)?.toInt(),
      searchQuery: json['searchQuery'] as List<dynamic>?,
      searchType: json['searchType'] as String?,
    );

Map<String, dynamic> _$SearchCriteriaToJson(SearchCriteria instance) => <String, dynamic>{
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
      'rooms': instance.rooms,
      'adults': instance.adults,
      'childern': instance.childern,
      'searchType': instance.searchType,
      'searchQuery': instance.searchQuery,
      'accommodation': instance.accommodation,
      'arrayOfExcludedsearchType': instance.arrayOfExcludedsearchType,
      'highPrice': instance.highPrice,
      'lowPrice': instance.lowPrice,
      'limit': instance.limit,
      'currency': instance.currency,
      'preloaderList': instance.preloaderList,
      'rid': instance.rid,
    };
