import 'package:json_annotation/json_annotation.dart';
part 'search_auto_entity.g.dart';

@JsonSerializable()
class SearchAutoEntity {
  String? action;
  SearchAutoComplete? searchAutoComplete;

  SearchAutoEntity({this.action, this.searchAutoComplete});
  factory SearchAutoEntity.fromJson(Map<String, dynamic> json) => _$SearchAutoEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SearchAutoEntityToJson(this);
}

@JsonSerializable()
class SearchAutoComplete {
  String? inputText;
  List? searchType;
  int? limit;

  SearchAutoComplete({this.inputText, this.limit, this.searchType});
  factory SearchAutoComplete.fromJson(Map<String, dynamic> json) => _$SearchAutoCompleteFromJson(json);
  Map<String, dynamic> toJson() => _$SearchAutoCompleteToJson(this);
}
