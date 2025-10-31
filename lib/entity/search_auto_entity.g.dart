// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_auto_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAutoEntity _$SearchAutoEntityFromJson(Map<String, dynamic> json) =>
    SearchAutoEntity(
      action: json['action'] as String?,
      searchAutoComplete: json['searchAutoComplete'] == null
          ? null
          : SearchAutoComplete.fromJson(
              json['searchAutoComplete'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchAutoEntityToJson(SearchAutoEntity instance) =>
    <String, dynamic>{
      'action': instance.action,
      'searchAutoComplete': instance.searchAutoComplete,
    };

SearchAutoComplete _$SearchAutoCompleteFromJson(Map<String, dynamic> json) =>
    SearchAutoComplete(
      inputText: json['inputText'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      searchType: json['searchType'] as List<dynamic>?,
    );

Map<String, dynamic> _$SearchAutoCompleteToJson(SearchAutoComplete instance) =>
    <String, dynamic>{
      'inputText': instance.inputText,
      'searchType': instance.searchType,
      'limit': instance.limit,
    };
