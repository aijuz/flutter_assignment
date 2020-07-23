// To parse this JSON data, do
//
//     final searchProductRequestModel = searchProductRequestModelFromJson(jsonString);

import 'dart:convert';

SearchProductRequestModel searchProductRequestModelFromJson(String str) =>
    SearchProductRequestModel.fromJson(json.decode(str));

String searchProductRequestModelToJson(SearchProductRequestModel data) =>
    json.encode(data.toJson());

class SearchProductRequestModel {
  SearchProductRequestModel({
    this.currentpage,
    this.pagesize,
    this.minPrice,
    this.maxPrice,
    this.custId,
    this.guestId,
    this.sortorder,
    this.searchstring,
    this.filter,
  });

  String currentpage;
  String pagesize;
  String minPrice;
  String maxPrice;
  dynamic custId;
  dynamic guestId;
  Sortorder sortorder;
  String searchstring;
  Filter filter;

  factory SearchProductRequestModel.fromJson(Map<String, dynamic> json) =>
      SearchProductRequestModel(
        currentpage: json["currentpage"],
        pagesize: json["pagesize"],
        minPrice: json["minPrice"],
        maxPrice: json["maxPrice"],
        custId: json["custId"],
        guestId: json["guestId"],
        sortorder: Sortorder.fromJson(json["sortorder"]),
        searchstring: json["searchstring"],
        filter: Filter.fromJson(json["filter"]),
      );

  Map<String, dynamic> toJson() => {
        "currentpage": currentpage,
        "pagesize": pagesize,
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "custId": custId,
        "guestId": guestId,
        "sortorder": sortorder.toJson(),
        "searchstring": searchstring,
        "filter": filter.toJson(),
      };
}

class Filter {
  Filter({
    this.category,
  });

  dynamic category;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
      };
}

class Sortorder {
  Sortorder({
    this.field,
    this.direction,
  });

  String field;
  String direction;

  factory Sortorder.fromJson(Map<String, dynamic> json) => Sortorder(
        field: json["field"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "field": field,
        "direction": direction,
      };
}
